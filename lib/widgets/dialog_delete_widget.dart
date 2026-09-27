import 'package:firebase_task_1/bloc/task_bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogDeleteWidget extends StatelessWidget {
  final int deleteTaskId ;
  const new({super.key,required this.deleteTaskId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirm"),
      content: Text("Are you sure you want to remove this task?"),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("clase"),
        ),
        SizedBox(height: 16),
        TextButton(
          onPressed: () {
            // context.read<TaskBloc>().add(DeleteTask(userId: null, deleteTaskId: ''));
            context.read<TaskBloc>().add(DeleteTask(deleteTaskId: deleteTaskId));

            Navigator.of(context).pop();
          },
          child: Text("Delete"),
        ),
      ],
    );
  }
}
