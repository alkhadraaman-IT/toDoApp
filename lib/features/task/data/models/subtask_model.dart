import '../../domain/entities/subtask_entity.dart';

/// نموذج المهمة الفرعية — يمتد الكيان النقي مع دعم JSON
class SubTaskModel extends SubTask {
  const SubTaskModel({
    required super.id,
    required super.title,
    super.isCompleted,
  });

  /// إنشاء من JSON (Map)
  factory SubTaskModel.fromJson(Map<String, dynamic> json) {
    return SubTaskModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }


  /// إنشاء من الكيان
  factory SubTaskModel.fromEntity(SubTask entity) {
    return SubTaskModel(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
    );
  }
}
