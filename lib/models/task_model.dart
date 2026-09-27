import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TaskModel {
  final int taskId;
  final int userId;
  final String taskName;
  final List<PartTask> partTask;
  TaskModel({
    required this.taskId,
    required this.userId,
    required this.taskName,
    required this.partTask,
  });

  TaskModel copyWith({
    int? taskId,
    int? userId,
    String? taskName,
    List<PartTask>? partTask,
  }) {
    return TaskModel(
      taskId: taskId ?? this.taskId,
      userId: userId ?? this.userId,
      taskName: taskName ?? this.taskName,
      partTask: partTask ?? this.partTask,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskId': taskId,
      'userId': userId,
      'taskName': taskName,
      'partTask': partTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskId: map['taskId'] as int,
      userId: map['userId'] as int,
      taskName: map['taskName'] as String,
      partTask: List<PartTask>.from((map['partTask'] as List<int>).map<PartTask>((x) => PartTask.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(taskId: $taskId, userId: $userId, taskName: $taskName, partTask: $partTask)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.taskId == taskId &&
      other.userId == userId &&
      other.taskName == taskName &&
      listEquals(other.partTask, partTask);
  }

  @override
  int get hashCode {
    return taskId.hashCode ^
      userId.hashCode ^
      taskName.hashCode ^
      partTask.hashCode;
  }
}
// / class TaskModel {
//   final int taskId;
//   final int userId;
//   final String taskName;
//   final List<PartTask> partTask;
//   TaskModel({
//     required this.taskId,
//     required this.userId,
//     required this.taskName,
//     required this.partTask,
//   });

//   TaskModel copyWith({
//     int? taskId,
//     int? userId,
//     String? taskName,
//     List<PartTask>? partTask,
//   }) {
//     return TaskModel(
//       taskId: taskId ?? this.taskId,
//       userId: userId ?? this.userId,
//       taskName: taskName ?? this.taskName,
//       partTask: partTask ?? this.partTask,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'taskId': taskId,
//       'userId': userId,
//       'taskName': taskName,
//       'partTask': partTask.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory TaskModel.fromMap(Map<String, dynamic> map) {
//     return TaskModel(
//       taskId: map['taskId'] as int,
//       userId: map['userId'] as int,
//       taskName: map['taskName'] as String,
//       partTask: List<PartTask>.from((map['partTask'] as List<int>).map<PartTask>((x) => PartTask.fromMap(x as Map<String,dynamic>),),),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'TaskModel(taskId: $taskId, userId: $userId, taskName: $taskName, partTask: $partTask)';
//   }

//   @override
//   bool operator ==(covariant TaskModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.taskId == taskId &&
//       other.userId == userId &&
//       other.taskName == taskName &&
//       listEquals(other.partTask, partTask);
//   }

//   @override
//   int get hashCode {
//     return taskId.hashCode ^
//       userId.hashCode ^
//       taskName.hashCode ^
//       partTask.hashCode;
//   }
// }

class PartTask {
  final int taskId;
  final int partTaskId;
  final String nameTask;
  final bool endTask;
  PartTask({
    required this.taskId,
    required this.partTaskId,
    required this.nameTask,
    required this.endTask,
  });

  PartTask copyWith({
    int? taskId,
    int? partTaskId,
    String? nameTask,
    bool? endTask,
  }) {
    return PartTask(
      taskId: taskId ?? this.taskId,
      partTaskId: partTaskId ?? this.partTaskId,
      nameTask: nameTask ?? this.nameTask,
      endTask: endTask ?? this.endTask,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskId': taskId,
      'partTaskId': partTaskId,
      'nameTask': nameTask,
      'endTask': endTask,
    };
  }

  factory PartTask.fromMap(Map<String, dynamic> map) {
    return PartTask(
      taskId: map['taskId'] as int,
      partTaskId: map['partTaskId'] as int,
      nameTask: map['nameTask'] as String,
      endTask: map['endTask'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PartTask.fromJson(String source) => PartTask.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PartTask(taskId: $taskId, partTaskId: $partTaskId, nameTask: $nameTask, endTask: $endTask)';
  }

  @override
  bool operator ==(covariant PartTask other) {
    if (identical(this, other)) return true;
  
    return 
      other.taskId == taskId &&
      other.partTaskId == partTaskId &&
      other.nameTask == nameTask &&
      other.endTask == endTask;
  }

  @override
  int get hashCode {
    return taskId.hashCode ^
      partTaskId.hashCode ^
      nameTask.hashCode ^
      endTask.hashCode;
  }
 }
