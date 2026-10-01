import 'package:equatable/equatable.dart';

import '../../domain/entities/task_entity.dart';

/// حالات وحدة المهام
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

/// الحالة الابتدائية
class TaskInitial extends TaskState {}

/// جاري التحميل
class TaskLoading extends TaskState {}

/// تم تحميل المهام
class TaskLoaded extends TaskState {
  final List<Task> allTasks;
  final List<Task> filteredTasks;
  final String searchQuery;
  final String selectedCategory;

  const TaskLoaded({
    this.allTasks = const [],
    this.filteredTasks = const [],
    this.searchQuery = '',
    this.selectedCategory = 'all',
  });

  TaskLoaded copyWith({
    List<Task>? allTasks,
    List<Task>? filteredTasks,
    String? searchQuery,
    String? selectedCategory,
  }) {
    return TaskLoaded(
      allTasks: allTasks ?? this.allTasks,
      filteredTasks: filteredTasks ?? this.filteredTasks,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [allTasks, filteredTasks, searchQuery, selectedCategory];
}

/// نجاح عملية
class TaskOperationSuccess extends TaskState {
  final String message;

  const TaskOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

/// خطأ
class TaskError extends TaskState {
  final String message;

  const TaskError(this.message);

  @override
  List<Object?> get props => [message];
}
