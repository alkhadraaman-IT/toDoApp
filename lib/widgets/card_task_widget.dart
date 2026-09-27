import 'package:firebase_task_1/widgets/dialog_delete_widget.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';
import 'dialog_edit_widget.dart';

class CardTaskWidget extends StatefulWidget {
  final TaskModel task;
  const CardTaskWidget({super.key, required this.task});

  @override
  State<CardTaskWidget> createState() => _CardTaskWidgetState();
}

class _CardTaskWidgetState extends State<CardTaskWidget> {
  @override
  Widget build(BuildContext context) {
    double sliderValue = 5;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xfffadeeb),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                widget.task.taskName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {
                  DialogDeleteWidget(deleteTaskId: widget.task.taskId,);
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              SizedBox(
                height: 20,
                width: 260,
                child: Slider(
                  year2023: true,
                  label: sliderValue.toInt().toString(),
                  min: 0,
                  max: 100,
                  divisions: 10,
                  thumbColor: Colors.blue.withAlpha(0),
                  activeColor: Color(0xff45496a),
                  inactiveColor: Color(0xfff596a1),
                  value: sliderValue,
                  onChanged: (double newValue) {
                    // print(newValue);
                    sliderValue = newValue;
                    print(sliderValue);
                    setState(() {});
                  },
                ),
              ),
              Text(
                sliderValue.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),

          SizedBox(
            height: 150,
            child: ListView.separated(
              itemCount: widget.task.partTask.length,
              itemBuilder: (BuildContext context, int i) {
                return Row(
                  children: [
                    Checkbox(
                      fillColor: WidgetStatePropertyAll(Color(0xfff596a1)),
                      value: widget.task.partTask[i].endTask,
                      onChanged: (value) {
                        value = !widget.task.partTask[i].endTask;
                      },
                    ),
                    Text(
                      widget.task.partTask[i].nameTask,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 8);
              },
            ),
          ),
          TextButton(
            onPressed: () {
              DialogEditWidget();
            },
            child: Text('Edit'),
          ),
        ],
      ),
    );
  }
}
