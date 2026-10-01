import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

/// حالة استخدام: إضافة مهمة جديدة
class AddTaskUseCase {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  Future<Either<Failure, Task>> call(Task task) {
    return repository.addTask(task);
  }
}
