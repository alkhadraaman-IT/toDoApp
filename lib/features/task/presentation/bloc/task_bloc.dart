import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart' hide Task;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/notification_service.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import 'task_event.dart';
import 'task_state.dart';

/// وحدة إدارة حالة المهام (BLoC)
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;
  final NotificationService notificationService;

  TaskBloc({required this.repository, required this.notificationService}) : super(TaskInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<WatchTasksEvent>(_onWatchTasks);
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<ToggleSubTaskEvent>(_onToggleSubTask);
    on<SearchTasksEvent>(_onSearchTasks);
    on<FilterByCategoryEvent>(_onFilterByCategory);
  }

  String? get _currentUserId => FirebaseAuth.instance.currentUser?.uid;

  Future<void> _onWatchTasks(
    WatchTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    final uid = _currentUserId;
    if (uid == null) {
      emit(const TaskError('User not authenticated'));
      return;
    }

    emit(TaskLoading());

    await emit.forEach<Either<Failure, List<Task>>>(
      repository.watchTasks(uid),
      onData: (eitherResult) {
        return eitherResult.fold(
          (failure) {
            log('Firestore stream error: ${failure.message}');
            return TaskError(failure.message);
          },
          (tasks) {
            debugPrint('Firestore stream: ${tasks.length} tasks received');
            final currentState = state;
            final freshTasks = List<Task>.from(
              tasks,
            ); // إجبار Dart على إنشاء مرجع قائمة جديد

            if (currentState is TaskLoaded) {
              return _applyFilters(currentState.copyWith(allTasks: freshTasks));
            }
            return TaskLoaded(
              allTasks: freshTasks,
              filteredTasks: freshTasks,
              selectedCategory: 'all',
            );
          },
        );
      },
      onError: (error, stackTrace) {
        log('Firestore stream system error: $error');
        emit(TaskError(error.toString())); // 👈 إرجاع حالة الخطأ ليتوقف الـ Loading
        return TaskError(error.toString());
      },
    );
  }

  Future<void> _onLoadTasks(
    LoadTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    final uid = _currentUserId;
    if (uid == null) {
      emit(const TaskError('User not authenticated'));
      return;
    }
    emit(TaskLoading());
    log('Loading tasks for user: $uid');
    final result = await repository.getTasks(uid);
    result.fold(
      (failure) {
        log('Load tasks failed: ${failure.message}');
        emit(TaskError(failure.message));
      },
      (tasks) {
        log('Loaded ${tasks.length} tasks');
        emit(TaskLoaded(allTasks: tasks, filteredTasks: tasks));
      },
    );
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    final uid = _currentUserId;
    if (uid == null) {
      emit(const TaskError('User not authenticated'));
      return;
    }
    log('Adding task: ${event.task.title}');
    debugPrint('Writing task to Firestore for user: $uid');
    final result = await repository.addTask(event.task);
    result.fold(
      (failure) {
        log('Add task failed: ${failure.message}');
        emit(TaskError(failure.message));
      },
      (task) {
        log('Task added successfully: ${task.id}');
        // جدولة إشعار التذكير إذا وجد
        if (task.reminderDateTime != null) {
          notificationService.scheduleTaskNotification(task.id, task.title, task.reminderDateTime!);
        }
      },
    );
  }

  /// دالة تعديل المهمة (Update)
  Future<void> _onUpdateTask(
    UpdateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    final uid = _currentUserId;
    if (uid == null) {
      emit(const TaskError('User not authenticated'));
      return;
    }
    final taskToUpdate = event.task.userId == uid
        ? event.task
        : event.task.copyWith(userId: uid);
    log('Updating task: ${taskToUpdate.id} for user: $uid');
    final result = await repository.updateTask(taskToUpdate);

    result.fold(
      (failure) {
        log('Update task failed: ${failure.message}');
        emit(TaskError(failure.message));
      },
      (updatedTask) {
        log('Task updated successfully: ${updatedTask.id}');
        // إلغاء الإشعار القديم وجدولة جديد إذا تغير الوقت
        notificationService.cancelTaskNotification(updatedTask.id);
        if (updatedTask.reminderDateTime != null) {
          notificationService.scheduleTaskNotification(updatedTask.id, updatedTask.title, updatedTask.reminderDateTime!);
        }
        // تحديث الحالة المحلية فوراً لضمان سلاسة الواجهة (Optimistic UI Update)
        if (state is TaskLoaded) {
          final current = state as TaskLoaded;
          final updatedList = List<Task>.from(
            current.allTasks.map((t) => t.id == updatedTask.id ? updatedTask : t),
          );
          emit(_applyFilters(current.copyWith(allTasks: updatedList)));
        }
      },
    );
  }

  Future<void> _onDeleteTask(
    DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    final uid = _currentUserId;
    if (uid == null) {
      emit(const TaskError('User not authenticated'));
      return;
    }
    log('Deleting task: ${event.taskId}');
    final result = await repository.deleteTask(uid, event.taskId);
    result.fold(
      (failure) {
        log('Delete task failed: ${failure.message}');
        emit(TaskError(failure.message));
      },
      (_) {
        log('Task deleted successfully: ${event.taskId}');
        // إلغاء إشعار التذكير المرتبط بالمهمة
        notificationService.cancelTaskNotification(event.taskId);
      },
    );
  }

  Future<void> _onToggleSubTask(
    ToggleSubTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    final uid = _currentUserId;
    if (uid == null) {
      emit(const TaskError('User not authenticated'));
      return;
    }
    log('Toggling subtask: ${event.subtaskId} in task: ${event.taskId}');
    final result = await repository.toggleSubtask(
      uid,
      event.taskId,
      event.subtaskId,
    );
    result.fold(
      (failure) {
        log('Toggle subtask failed: ${failure.message}');
        emit(TaskError(failure.message));
      },
      (task) {
        log('Subtask toggled successfully');
      },
    );
  }

  void _onSearchTasks(SearchTasksEvent event, Emitter<TaskState> emit) {
    if (state is TaskLoaded) {
      emit(
        _applyFilters((state as TaskLoaded).copyWith(searchQuery: event.query)),
      );
    }
  }

  void _onFilterByCategory(
    FilterByCategoryEvent event,
    Emitter<TaskState> emit,
  ) {
    if (state is TaskLoaded) {
      emit(
        _applyFilters(
          (state as TaskLoaded).copyWith(selectedCategory: event.category),
        ),
      );
    }
  }

  TaskLoaded _applyFilters(TaskLoaded currentState) {
    var filtered = currentState.allTasks;
    final categoryFilter = currentState.selectedCategory
        .toLowerCase()
        .trim()
        .replaceAll(' ', '_');
    if (categoryFilter != 'all') {
      filtered = filtered
          .where(
            (t) =>
                t.category.toLowerCase().trim().replaceAll(' ', '_') ==
                categoryFilter,
          )
          .toList();
    }
    if (currentState.searchQuery.isNotEmpty) {
      final query = currentState.searchQuery.toLowerCase();
      filtered = filtered
          .where((t) => t.title.toLowerCase().contains(query))
          .toList();
    }
    return currentState.copyWith(filteredTasks: filtered);
  }
}
