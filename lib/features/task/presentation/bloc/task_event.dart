import 'package:equatable/equatable.dart';

import '../../domain/entities/task_entity.dart';

/// أحداث وحدة المهام
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

/// تحميل جميع المهام
class LoadTasksEvent extends TaskEvent {
  final String userId;
  const LoadTasksEvent(this.userId);
  @override
  List<Object?> get props => [userId];
}

/// الاستماع للبث المباشر من Firestore
class WatchTasksEvent extends TaskEvent {
  final String userId;
  const WatchTasksEvent({required this.userId});
  @override
  List<Object?> get props => [userId];
}

/// إضافة مهمة جديدة
class AddTaskEvent extends TaskEvent {
  final Task task;
  const AddTaskEvent(this.task);
  @override
  List<Object?> get props => [task];
}

/// تحديث مهمة
class UpdateTaskEvent extends TaskEvent {
  final Task task;
  const UpdateTaskEvent(this.task);
  @override
  List<Object?> get props => [task];
}

/// حذف مهمة
class DeleteTaskEvent extends TaskEvent {
  final String taskId;
  const DeleteTaskEvent(this.taskId);
  @override
  List<Object?> get props => [taskId];
}

/// تبديل حالة مهمة فرعية
class ToggleSubTaskEvent extends TaskEvent {
  final String taskId;
  final String subtaskId;
  const ToggleSubTaskEvent(this.taskId, this.subtaskId);
  @override
  List<Object?> get props => [taskId, subtaskId];
}

/// البحث في المهام محلياً
class SearchTasksEvent extends TaskEvent {
  final String query;
  const SearchTasksEvent(this.query);
  @override
  List<Object?> get props => [query];
}

/// التصفية حسب التصنيف
class FilterByCategoryEvent extends TaskEvent {
  final String category;
  const FilterByCategoryEvent(this.category);
  @override
  List<Object?> get props => [category];
}
