import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../repositories/task_repository.dart';

/// حالة استخدام: حذف مهمة
class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase(this.repository);

  Future<Either<Failure, void>> call(String userId, String taskId) {
    return repository.deleteTask(userId, taskId);
  }
}
