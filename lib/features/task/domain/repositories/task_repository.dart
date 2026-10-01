import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../entities/task_entity.dart';

/// واجهة مستودع المهام
abstract class TaskRepository {
  Stream<Either<Failure, List<Task>>> watchTasks(String userId);

  Future<Either<Failure, List<Task>>> getTasks(String userId);

  Future<Either<Failure, Task>> addTask(Task task);

  Future<Either<Failure, Task>> updateTask(Task task);

  Future<Either<Failure, void>> deleteTask(String userId, String taskId);

  Future<Either<Failure, Task>> toggleSubtask(String userId, String taskId, String subtaskId);
}
