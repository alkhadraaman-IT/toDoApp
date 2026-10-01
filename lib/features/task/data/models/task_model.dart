import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/task_entity.dart';
import 'subtask_model.dart';

/// نموذج المهمة — يمتد الكيان النقي مع دعم JSON
class TaskModel extends Task {
  const TaskModel({
    required super.id,
    required super.userId,
    required super.title,
    super.description,
    required super.category,
    super.subTasks,
    super.reminderDateTime,
    super.isCompleted,
  });

  // 1. دالة التحويل من Firestore Map إلى Model
  factory TaskModel.fromMap(Map<String, dynamic> map, String docId) {
    return TaskModel(
      id: docId,
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'],
      category: map['category'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
      // 👈 تحويل Timestamp من Firestore إلى DateTime
      reminderDateTime: map['reminderDateTime'] != null
          ? (map['reminderDateTime'] is Timestamp
                ? (map['reminderDateTime'] as Timestamp).toDate()
                : DateTime.tryParse(map['reminderDateTime'].toString()))
          : null,
      // 👈 تحويل قائمة المهام الفرعية SubTasks
      subTasks: map['subTasks'] != null
          ? (map['subTasks'] as List)
                .map((item) => SubTask.fromMap(item as Map<String, dynamic>))
                .toList()
          : const [],
    );
  }
  // 2. دالة التحويل من Model إلى Map للحفظ في Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'category': category,
      'isCompleted': isCompleted,
      // 👈 تحويل DateTime إلى Timestamp قبل الحفظ في Firebase
      'reminderDateTime': reminderDateTime != null
          ? Timestamp.fromDate(reminderDateTime!)
          : null,
      // 👈 تحويل قائمة المهام الفرعية إلى List of Maps
      'subTasks': subTasks.map((subTask) => subTask.toMap()).toList(),
    };
  }

  /// إنشاء من JSON (Map)
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> subTasksJson = json['subTasks'] as List<dynamic>? ?? [];
    return TaskModel(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      category: json['category'] as String? ?? 'أخرى',
      subTasks: subTasksJson
          .map((e) => SubTaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reminderDateTime: json['reminderDateTime'] != null
          ? DateTime.parse(json['reminderDateTime'] as String)
          : null,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  /// تحويل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'category': category,
      'subTasks': subTasks
          .map((e) => SubTaskModel.fromEntity(e).toMap())
          .toList(),
      'reminderDateTime': reminderDateTime?.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  /// إنشاء من الكيان
  factory TaskModel.fromEntity(Task entity) {
    return TaskModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      subTasks: entity.subTasks.map((e) => SubTaskModel.fromEntity(e)).toList(),
      reminderDateTime: entity.reminderDateTime,
      isCompleted: entity.isCompleted,
    );
  }

  /// نسخ مع تعديل — يُرجع TaskModel
  @override
  TaskModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? category,
    List<SubTask>? subTasks,
    DateTime? reminderDateTime,
    bool? isCompleted,
  }) {
    return TaskModel(
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
}
