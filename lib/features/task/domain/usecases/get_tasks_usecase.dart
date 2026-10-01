import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

/// حالة استخدام: جلب جميع المهام
class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  Future<Either<Failure, List<Task>>> call(String userId) {
    return repository.getTasks(userId);
  }
}
