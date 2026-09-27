part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class GetTasks extends TaskEvent {
  // final int userId;

  // GetTasks({required this.userId});
}

final class PostTask extends TaskEvent {
  final TaskModel newTask;
  // final int userId;

  PostTask({required this.newTask});
  // PostTask({required this.userId, required this.newTask});
}

final class GetTask extends TaskEvent {
  final int taskId;
  // final int userId;

  GetTask({required this.taskId});
  // GetTask({required this.taskId, required this.userId});
}

final class UpdateTask extends TaskEvent {
  final TaskModel updateTask;
  // final int userId;

  UpdateTask({required this.updateTask});
  // UpdateTask({required this.updateTask, required this.userId});
}

final class DeleteTask extends TaskEvent {
  final int deleteTaskId;
  // final int userId;

  DeleteTask({required this.deleteTaskId});
  // DeleteTask({required this.userId, required this.deleteTaskId});
}
