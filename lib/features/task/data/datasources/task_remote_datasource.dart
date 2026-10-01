import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';

/// واجهة مصدر البيانات البعيد للمهام
abstract class TaskRemoteDataSource {
  Stream<List<TaskModel>> watchTasks(String userId);

  Future<List<TaskModel>> getTasks(String userId);

  Future<TaskModel> addTask(TaskModel task);

  Future<TaskModel> updateTask(TaskModel task);

  Future<void> deleteTask(String userId, String taskId);

  Future<TaskModel> toggleSubtask(String userId, String taskId, String subtaskId);
}

/// تنفيذ مصدر البيانات باستخدام Cloud Firestore
class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final FirebaseFirestore _firestore;

  TaskRemoteDataSourceImpl([FirebaseFirestore? firestore])
      : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference _userTasksCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('tasks');
  }

  @override
  Stream<List<TaskModel>> watchTasks(String userId) {
    return _userTasksCollection(userId).snapshots().map((snapshot) {
      final tasks = <TaskModel>[];
      for (var doc in snapshot.docs) {
        try {
          final data = doc.data() as Map<String, dynamic>;
          // تم نمرير map و doc.id كوسطاء منفصلين
          final task = TaskModel.fromMap(data, doc.id);
          tasks.add(task);
        } catch (e, stackTrace) {
          debugPrint('❌ Error parsing task ${doc.id}: $e');
          debugPrint(stackTrace.toString());
        }
      }
      return tasks;
    });
  }

  @override
  Future<List<TaskModel>> getTasks(String userId) async {
    final snapshot = await _userTasksCollection(userId).get();
    final tasks = <TaskModel>[];
    for (var doc in snapshot.docs) {
      try {
        final data = doc.data() as Map<String, dynamic>;
        // تم نمرير map و doc.id كوسطاء منفصلين
        final task = TaskModel.fromMap(data, doc.id);
        tasks.add(task);
      } catch (e, stackTrace) {
        debugPrint('❌ Error parsing task ${doc.id}: $e');
        debugPrint(stackTrace.toString());
      }
    }
    return tasks;
  }

  @override
  Future<TaskModel> addTask(TaskModel task) async {
    final path = 'users/${task.userId}/tasks/${task.id}';
    debugPrint('Writing task to Firestore path: $path');
    await _userTasksCollection(task.userId).doc(task.id).set(task.toMap());
    debugPrint('Task successfully written to Firestore');
    return task;
  }

  @override
Future<TaskModel> updateTask(TaskModel task) async {
  await _userTasksCollection(task.userId).doc(task.id).set(
    task.toMap(),
    SetOptions(merge: true),
  );
  return task;
}

  @override
  Future<void> deleteTask(String userId, String taskId) async {
    await _userTasksCollection(userId).doc(taskId).delete();
  }

 @override
  Future<TaskModel> toggleSubtask(String userId, String taskId, String subtaskId) async {
    final snapshot = await _userTasksCollection(userId).doc(taskId).get();
    final task = TaskModel.fromMap(snapshot.data() as Map<String, dynamic>, snapshot.id);
    final updatedSubTasks = task.subTasks.map((st) {
      if (st.id == subtaskId) return st.copyWith(isCompleted: !st.isCompleted);
      return st;
    }).toList();
    final updatedTask = task.copyWith(subTasks: updatedSubTasks);
    await _userTasksCollection(userId).doc(taskId).update(updatedTask.toMap());
    return updatedTask;
  }
}
