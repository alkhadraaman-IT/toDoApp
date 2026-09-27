import '../models/task_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class TakeDatasourcs {
  FirebaseFirestore db = FirebaseFirestore.instance;
  // DatabaseReference ref = FirebaseDatabase.instance.ref();
  getTasksForUser({required int id}) {
    db.collection("User").doc(id.toString()).collection("Tasks").get();
  }

  getTasks() {
    db.collection("Tasks").get();
  }

  updateTask({required TaskModel taskUpdate}) {
    db.collection("Tasks").doc(taskUpdate.taskId.toString()).update(taskUpdate.toMap());
  }

  deteteTask({required int taskId}) {
    db.collection("Tasks").doc(taskId.toString()).delete();
  }

  addTask({required TaskModel task}) {
    db.collection("Tasks").add(task.toMap());
  }
}
