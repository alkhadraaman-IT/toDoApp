import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

/// حالة استخدام: تحديث مهمة موجودة
class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  Future<Either<Failure, Task>> call(Task task) {
    return repository.updateTask(task);
  }
}
