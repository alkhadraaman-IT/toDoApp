import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task_1/bloc/task_bloc/task_bloc.dart';
import 'package:firebase_task_1/widgets/dialog_delete_widget.dart';
import 'package:firebase_task_1/widgets/dialog_edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../models/task_model.dart';
import '../widgets/card_task_widget.dart';
import '../widgets/date_picker_widget.dart';
import '../widgets/dialog_add_widget.dart';

class HomeView extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TaskModel> tasks = [
    TaskModel(
      taskId: 1,
      userId: 1,
      taskName: 'Task1',
      partTask: [
        PartTask(
          taskId: 1,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: true,
          partTaskId: 1,
        ),
        PartTask(
          taskId: 2,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: true,
          partTaskId: 1,
        ),
      ],
    ),
    TaskModel(
      taskId: 1,
      userId: 1,
      taskName: 'Task1',
      partTask: [
        PartTask(
          taskId: 1,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: false,
          partTaskId: 1,
        ),
        PartTask(
          taskId: 2,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: true,
          partTaskId: 1,
        ),
        PartTask(
          taskId: 3,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: true,
          partTaskId: 1,
        ),
      ],
    ),
    TaskModel(
      taskId: 1,
      userId: 1,
      taskName: 'Task1',
      partTask: [
        PartTask(
          taskId: 1,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: false,
          partTaskId: 1,
        ),
        PartTask(
          taskId: 2,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: false,
          partTaskId: 1,
        ),
        PartTask(
          taskId: 3,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: true,
          partTaskId: 1,
        ),
        PartTask(
          taskId: 4,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: false,
          partTaskId: 1,
        ),
      ],
    ),
    TaskModel(
      taskId: 1,
      userId: 1,
      taskName: 'Task',
      partTask: [
        PartTask(
          taskId: 1,
          nameTask: 'Date DateDateDate DateDateDate',
          endTask: false,
          partTaskId: 1,
        ),
      ],
    ),
  ];
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          // TaskBloc()..add(GetTasks(userId: 1)),
          TaskBloc()..add(GetTasks()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: Image.asset(
                'assets/logo.png',
                height: 120,
                width: 120,
                fit: .cover,
              ),
              title: Text('TO DO LIST'),
              actions: [
                IconButton(icon: Icon(Icons.logout), onPressed: () async {}),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                DialogAddWidget();
              },
              child: Icon(Icons.add),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 1000,
                  child: Column(
                    crossAxisAlignment: .start,
                    spacing: 20,
                    children: [
                      Text(
                        'Make a difference in your life.',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextButton(
                            onPressed: () {
                              datePrickerWidget(context, today).then((
                                pickedDate,
                              ) {
                                print(
                                  'pickedDate: ${DateFormat('yyyy-MM-dd').format(pickedDate!)}',
                                );
                                setState(() {
                                  today = pickedDate;
                                });
                              });
                            },
                            child: Text('Pick Date'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Color(0xffc4e1f6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: .center,
                              mainAxisAlignment: .center,
                              children: [
                                Text(
                                  '90',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium,
                                ),
                                Text(
                                  'Date',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Color(0xffc4e1f6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: .center,
                              mainAxisAlignment: .center,
                              children: [
                                Text(
                                  '9',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium,
                                ),
                                Text(
                                  'Date',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Color(0xffc4e1f6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: .center,
                              mainAxisAlignment: .center,
                              children: [
                                Text(
                                  '45',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium,
                                ),
                                Text(
                                  'Date',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Tasks:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      BlocBuilder<TaskBloc, TaskState>(
                        builder: (context, state) {
                          switch (state) {
                            case TaskInitial():
                            case TaskLoading():
                              return Center(child: CircularProgressIndicator());
                            case TaskSuccess():
                              return Expanded(
                                child: ListView.separated(
                                  itemCount: tasks.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Dismissible(
                                      key: ValueKey(tasks[index].taskId),
                                      background: Container(
                                        alignment: Alignment.centerLeft,
                                        color: Color(0xfff596a1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Icon(
                                            Icons.delete,
                                            color: Color(0xff1C2A3A),
                                          ),
                                        ),
                                      ),
                                      secondaryBackground: Container(
                                        alignment: Alignment.centerRight,
                                        color: Color(0xffc4e1f6),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Icon(
                                            Icons.edit,
                                            color: Color(0xff1C2A3A),
                                          ),
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        if (direction ==
                                            DismissDirection.startToEnd) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    "Successfully removed",
                                                  ),
                                                ),
                                              );
                                        }
                                      },
                                      confirmDismiss: (direction) async {
                                        if (direction ==
                                            DismissDirection.startToEnd) {
                                          return await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return DialogDeleteWidget(
                                                deleteTaskId:
                                                    tasks[index].taskId,
                                              );
                                            },
                                          );
                                        } else {
                                          print(
                                            "========= Edite ===============",
                                          );
                                          if (direction ==
                                              DismissDirection.endToStart) {
                                            return await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return DialogEditWidget();
                                              },
                                            );
                                          }
                                        }
                                      },

                                      movementDuration: Duration(seconds: 3),
                                      resizeDuration: Duration(seconds: 3),

                                      child: CardTaskWidget(task: tasks[index]),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                        return SizedBox(height: 16);
                                      },
                                ),
                              );
                            case TaskFailure():
                              return Column(
                                children: [
                                  Icon(Icons.warning_rounded),
                                  Text(state.errorMessage),
                                ],
                              );
                            case oppSecFailure():
                              // TODO: Handle this case.
                              throw UnimplementedError();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
