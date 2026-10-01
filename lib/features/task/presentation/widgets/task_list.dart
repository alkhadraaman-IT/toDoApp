import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/task_entity.dart';
import 'task_card.dart';

/// قائمة المهام — تستقبل كيانات [Task]
class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final void Function(String taskId, String subtaskId)? onToggleSubtask;
  final void Function(String taskId)? onDelete;
  final void Function(Task task)? onEdit;

  const TaskList({
    super.key,
    required this.tasks,
    this.onToggleSubtask,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(top: 48.h),
          child: Column(
            children: [
              Icon(
                Icons.task_alt_rounded,
                size: 64.w,
                color: Theme.of(context).colorScheme.outline,
              ),
              SizedBox(height: 16.h),
              Text(
                'noTasks'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 4.h),
              Text(
                'addTaskToStart'.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      );
    }

    return SliverList.separated(
      itemCount: tasks.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskCard(
          task: task,
          onToggleSubtask: onToggleSubtask,
          onDelete: onDelete,
          onEdit: onEdit,
        );
      },
    );
  }
}
