import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/task_entity.dart';

String formatReminderDateTime(DateTime dateTime) {
  final now = DateTime.now();

  // 1. تحديد ما إذا كان الوقت محدداً بالفعل أم أنه الوقت الافتراضي (منتصف الليل 00:00)
  final bool hasTime = !(dateTime.hour == 0 && dateTime.minute == 0);

  // 2. تجهيز مقارنات التواريخ بأسلوب نظيف (بدون تأثر بالساعات)
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = today.add(const Duration(days: 1));
  final targetDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

  // 3. صيغة الوقت (مثال: 09:00 AM)
  final timeString = hasTime
      ? ' ${DateFormat('hh:mm a').format(dateTime)}'
      : '';

  // 4. تطبيق منطق التطبيقات العالمية
  if (targetDate.isAtSameMomentAs(today)) {
    // اليوم
    return hasTime ? DateFormat('hh:mm a').format(dateTime) : 'today'.tr();
  } else if (targetDate.isAtSameMomentAs(tomorrow)) {
    // غداً
    return '${'tomoro'.tr()}$timeString';
  } else if (dateTime.year == now.year) {
    // نفس السنة الحالية (عرض اليوم والشهر)
    final dateString = DateFormat('dd MMM').format(dateTime); // مثال: 15 Oct
    return '$dateString$timeString';
  } else {
    // سنة مختلفة (عرض التاريخ كاملاً مع السنة)
    final dateString = DateFormat('dd/MM/yyyy').format(dateTime);
    return '$dateString$timeString';
  }
}

/// تحويل مفتاح التصنيف إلى نص مترجم
String _categoryLabel(String category) {
  switch (category.toLowerCase().trim().replaceAll(' ', '_')) {
    case 'work':
      return 'work'.tr();
    case 'home':
      return 'home'.tr();
    case 'personal_development':
      return 'personal_development'.tr();
    case 'health':
      return 'health'.tr();
    case 'other':
      return 'other'.tr();
    default:
      return category;
  }
}

/// بطاقة المهمة — تدعم الحذف بالسحب والتعديل بالسحب والنقر
class TaskCard extends StatelessWidget {
  final Task task;
  final void Function(String taskId, String subtaskId)? onToggleSubtask;
  final void Function(String taskId)? onDelete;
  final void Function(Task task)? onEdit;

  const TaskCard({
    super.key,
    required this.task,
    this.onToggleSubtask,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final progress = task.progressPercentage;
    final isCompleted = progress == 1.0;
    final completedCount = task.subTasks.where((s) => s.isCompleted).length;

    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.horizontal,
      background: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 24.w),
        decoration: BoxDecoration(
          color: colors.primaryContainer,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit_rounded,
              size: 28.w,
              color: colors.onPrimaryContainer,
            ),
            SizedBox(height: 4.h),
            Text(
              'edit'.tr(),
              style: TextStyle(
                color: colors.onPrimaryContainer,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 24.w),
        decoration: BoxDecoration(
          color: colors.errorContainer,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delete_outline_rounded,
              size: 28.w,
              color: colors.onErrorContainer,
            ),
            SizedBox(height: 4.h),
            Text(
              'delete'.tr(),
              style: TextStyle(
                color: colors.onErrorContainer,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          // سحب لليمين = تعديل
          onEdit?.call(task);
          return false;
        } else {
          // سحب لليسار = حذف
          return await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('confirmDelete'.tr()),
              content: Text('confirmDeleteMessage'.tr()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: Text('cancel'.tr()),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.error,
                    foregroundColor: colors.onError,
                  ),
                  child: Text('delete'.tr()),
                ),
              ],
            ),
          );
        }
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete?.call(task.id);

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              backgroundColor: colors.inverseSurface,
              content: Text(
                '${'taskDeleted'.tr()}: "${task.title}"',
                style: TextStyle(
                  color: colors.onInverseSurface,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }
      },
      child: InkWell(
        onTap: onEdit != null ? () => onEdit!(task) : null,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: colors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: colors.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- الصف العلوي: التصنيف + التاريخ والتذكير (إن وجد) + حالة الاكتمال ---
              // --- الصف العلوي في كرت المهمة ---
              Row(
                children: [
                  // شارة التصنيف (Category)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      _categoryLabel(task.category),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colors.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // ⏰ الجزء الخاص بالتاريخ والوقت (إذا كان موجوداً)
                  // في كرت المهمة TaskCard
                  if (task.reminderDateTime != null) ...[
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.alarm_rounded,
                            size: 14.w,
                            color: colors.primary,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            formatReminderDateTime(
                              task.reminderDateTime!,
                            ), // 👈 دالة التنسيق الذكية
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const Spacer(),

                  // شارة تم الإنجاز
                  if (isCompleted)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: colors.secondaryContainer,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        'completed'.tr(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: colors.onSecondaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 12.h),

              // --- عنوان المهمة ---
              Text(
                task.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                  color: isCompleted
                      ? colors.onSurfaceVariant
                      : colors.onSurface,
                ),
              ),

              // --- وصف المهمة (إذا وجد) ---
              if (task.description != null &&
                  task.description!.trim().isNotEmpty) ...[
                SizedBox(height: 6.h),
                Text(
                  task.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    height: 1.3,
                  ),
                ),
              ],

              SizedBox(height: 16.h),

              // --- شريط التقدم والنسبة المئوية ---
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 6.h,
                        backgroundColor: colors.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isCompleted ? colors.secondary : colors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isCompleted ? colors.secondary : colors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                '$completedCount ${'of'.tr()} ${task.subTasks.length} ${'subtasks'.tr()}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),

              // --- قائمة المهام الفرعية ---
              if (task.subTasks.isNotEmpty) ...[
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainer,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: task.subTasks.take(3).map((subtask) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: onToggleSubtask != null
                                  ? () => onToggleSubtask?.call(
                                      task.id,
                                      subtask.id,
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(4.r),
                              child: Icon(
                                subtask.isCompleted
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded,
                                size: 20.w,
                                color: subtask.isCompleted
                                    ? colors.primary
                                    : colors.outline,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                subtask.title,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  decoration: subtask.isCompleted
                                      ? TextDecoration.lineThrough
                                      : null,
                                  color: subtask.isCompleted
                                      ? colors.onSurfaceVariant
                                      : colors.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
