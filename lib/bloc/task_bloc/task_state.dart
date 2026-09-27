part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {
  final List<TaskModel> tasks;

  TaskSuccess({required this.tasks});
}

final class TaskFailure extends TaskState {
  final String errorMessage;

  TaskFailure({required this.errorMessage});
}

final class oppSecFailure extends TaskState {

}
