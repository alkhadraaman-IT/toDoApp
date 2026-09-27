import '../core/config/di.dart';
import '../datasouecses/take_datasourcs.dart';
import '../models/task_model.dart';

class TaskRepo {
  TakeDatasourcs taskDatasourcs = sl.get<TakeDatasourcs>();
  getTasksForUser({required int id}) {
    return taskDatasourcs.getTasksForUser(id: id);
  }

  getTasks() {
    return taskDatasourcs.getTasks();
  }

  updateTask({required TaskModel taskUpdate}) {
    return taskDatasourcs.updateTask(taskUpdate: taskUpdate);
  }

  deteteTask({required int taskId}) {
    return taskDatasourcs.deteteTask(taskId: taskId);
  }

  addTask({required TaskModel task}) {
    return taskDatasourcs.addTask(task: task);
  }
}
