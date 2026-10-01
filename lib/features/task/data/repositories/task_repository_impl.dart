import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_remote_datasource.dart';
import '../models/task_model.dart';

/// تنفيذ مستودع المهام
class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Stream<Either<Failure, List<Task>>> watchTasks(String userId) {
    return remoteDataSource.watchTasks(userId).map(
      (models) => Right<Failure, List<Task>>(models),
    ).handleError((error) {
      return Left<Failure, List<Task>>(_mapError(error));
    });
  }

  @override
  Future<Either<Failure, List<Task>>> getTasks(String userId) async {
    if (!await networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final models = await remoteDataSource.getTasks(userId);
      return Right(models);
    } catch (e) {
      return Left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, Task>> addTask(Task task) async {
    print('Repo Task Date: ${task.reminderDateTime}');
    if (!await networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final model = await remoteDataSource.addTask(TaskModel.fromEntity(task));
      return Right(model);
    } catch (e) {
      return Left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, Task>> updateTask(Task task) async {
    print('Repo Task Date edit: ${task.reminderDateTime}');
    if (!await networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final model = await remoteDataSource.updateTask(TaskModel.fromEntity(task));
      return Right(model);
    } catch (e) {
      return Left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(String userId, String taskId) async {
    if (!await networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      await remoteDataSource.deleteTask(userId, taskId);
      return const Right(null);
    } catch (e) {
      return Left(_mapError(e));
    }
  }

  @override
  Future<Either<Failure, Task>> toggleSubtask(String userId, String taskId, String subtaskId) async {
    if (!await networkInfo.isConnected) return const Left(NetworkFailure());
    try {
      final model = await remoteDataSource.toggleSubtask(userId, taskId, subtaskId);
      return Right(model);
    } catch (e) {
      return Left(_mapError(e));
    }
  }

  Failure _mapError(Object error) {
    if (error is NetworkFailure) return error;
    return UnexpectedFailure(error.toString());
  }
}
