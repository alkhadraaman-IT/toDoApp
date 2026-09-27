import 'package:firebase_task_1/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_bloc/task_bloc.dart';

class DialogEditWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskName = TextEditingController();
    TextEditingController partTask = TextEditingController();
    return AlertDialog(
      title: Text("Edit Task"),
      content: Column(
        mainAxisSize: .min,
        children: [
          TextFormField(
            validator: (String? value) {
              if (value!.isEmpty) {
                return "Please fill this filed";
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            controller: taskName,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff45496a)),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff45496a)),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(50),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(50),
              ),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock, color: Color(0xff45496a)),
                  SizedBox(width: 8),
                  Text(
                    'Task Name',
                    style: TextStyle(
                      color: Color(0xff45496a),
                      fontSize: 16,
                      fontWeight: FontWeight(700),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 23),
          TextFormField(
            validator: (String? value) {
              if (value!.isEmpty) {
                return "Please fill this filed";
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
            controller: partTask,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff45496a)),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff45496a)),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(50),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(50),
              ),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock, color: Color(0xff45496a)),
                  SizedBox(width: 8),
                  Text(
                    'Part Task',
                    style: TextStyle(
                      color: Color(0xff45496a),
                      fontSize: 16,
                      fontWeight: FontWeight(700),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 23),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Clase"),
        ),
        SizedBox(height: 16),
        FilledButton(
          onPressed: () {
                        context.read<TaskBloc>().add(UpdateTask(updateTask: TaskModel(taskId: 1, taskName: 'taskName', partTask: [PartTask(taskId: 1, partTaskId: 1, nameTask: '', endTask: true)], userId: 1)));

            Navigator.of(context).pop();
          },
          child: Text("Edit"),
        ),
      ],
    );
  }
}
