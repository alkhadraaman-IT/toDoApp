import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

/// حالة استخدام: تبديل حالة مهمة فرعية
class ToggleSubtaskUseCase {
  final TaskRepository repository;

  ToggleSubtaskUseCase(this.repository);

  Future<Either<Failure, Task>> call(String userId, String taskId, String subtaskId) {
    return repository.toggleSubtask(userId, taskId, subtaskId);
  }
}
