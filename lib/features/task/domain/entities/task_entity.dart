import 'package:equatable/equatable.dart';

import 'subtask_entity.dart';

class Task extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final String category;
  final List<SubTask> subTasks;
  final DateTime? reminderDateTime;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.category,
    this.subTasks = const [],
    this.reminderDateTime,
    this.isCompleted = false,
  });

  double get progressPercentage {
    if (subTasks.isEmpty) return isCompleted ? 1.0 : 0.0;
    final completedCount = subTasks.where((st) => st.isCompleted).length;
    return completedCount / subTasks.length;
  }

  Task copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? category,
    List<SubTask>? subTasks,
    DateTime? reminderDateTime,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      subTasks: subTasks ?? this.subTasks,
      reminderDateTime: reminderDateTime ?? this.reminderDateTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    title,
    description,
    category,
    subTasks,
    reminderDateTime,
    isCompleted,
  ];
}
