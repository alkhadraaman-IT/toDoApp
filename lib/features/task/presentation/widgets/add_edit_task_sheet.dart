import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/helper/toast_util.dart';
import '../../domain/entities/subtask_entity.dart';
import '../../domain/entities/task_entity.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';

class AddEditTaskSheet extends StatefulWidget {
  final Task? task;
  const AddEditTaskSheet({super.key, this.task});

  @override
  State<AddEditTaskSheet> createState() => _AddEditTaskSheetState();
}

class _AddEditTaskSheetState extends State<AddEditTaskSheet> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _subtaskController = TextEditingController();

  String _selectedCategory = 'work';
  
  // 👈 تم رفع المتغيرات لتكون على مستوى الـ State لكي تتذكر الاختيارات
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<SubTask> _subtasks = [];
  final _uuid = const Uuid();
  bool _isSaving = false;

  final List<String> _categories = [
    'work',
    'home',
    'personal_development',
    'health',
    'other',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description ?? '';
      _selectedCategory = widget.task!.category;
      _subtasks.addAll(widget.task!.subTasks);
      
      // 👈 إذا كانت المهمة تحتوي على تاريخ قديم (عند التعديل)، نقوم بفصله ليظهر في الأزرار
      if (widget.task!.reminderDateTime != null) {
        _selectedDate = widget.task!.reminderDateTime;
        _selectedTime = TimeOfDay.fromDateTime(widget.task!.reminderDateTime!);
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _subtaskController.dispose();
    super.dispose();
  }

  // 👈 دمج التاريخ والوقت معاً بشكل صحيح
  DateTime? _getCombinedReminderDateTime() {
  // إذا لم يختر التاريخ ولا الوقت -> لا يوجد تذكير
  if (_selectedDate == null && _selectedTime == null) return null;

  // إذا اختار وقتاً فقط، افترض أن التاريخ هو اليوم
  final date = _selectedDate ?? DateTime.now();
  
  // إذا اختار تاريخاً فقط، افترض أن الوقت هو الساعة 9 صباحاً
  final time = _selectedTime ?? const TimeOfDay(hour: 0, minute: 0);

  return DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );
}

  Future<void> _saveTask() async {
    if (_isSaving) return;
    setState(() => _isSaving = true);

    debugPrint('[AddEditTaskSheet] Save button pressed');
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('enterTaskTitle'.tr())));
    //  ToastUtil.showError('enterTaskTitle'.tr());
      setState(() => _isSaving = false);
      return;
    }

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("userNotLoggedIn".tr())));
      // ToastUtil.showError("userNotLoggedIn".tr());
      setState(() => _isSaving = false);
      return;
    }
    final userId = currentUser.uid;

    final normalizedCategory = _selectedCategory
        .toLowerCase()
        .trim()
        .replaceAll(' ', '_');

    // 👈 استدعاء الدالة لدمج التاريخ والوقت المحددين
    final finalReminderDateTime = _getCombinedReminderDateTime();

    final task = Task(
      id: widget.task?.id ?? _uuid.v4(),
      userId: userId,
      title: title,
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      category: normalizedCategory,
      subTasks: List<SubTask>.from(_subtasks),
      reminderDateTime: finalReminderDateTime, // 👈 إرسال التاريخ المدمج الصحيح
      isCompleted: widget.task?.isCompleted ?? false,
    );

    print("Sending reminderDateTime to Bloc: $finalReminderDateTime");
    final bloc = context.read<TaskBloc>();
    debugPrint(
      '[AddEditTaskSheet] Dispatching AddTaskEvent for task: ${task.title}',
    );
    
    if (widget.task != null) {
      bloc.add(UpdateTaskEvent(task));
    } else {
      bloc.add(AddTaskEvent(task));
    }
    debugPrint('[AddEditTaskSheet] Task dispatched successfully');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final bottomPadding = MediaQuery.viewInsetsOf(context).bottom;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHigh,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 32.w,
                  height: 4.h,
                  margin: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: colors.outlineVariant,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      size: 24.w,
                      color: colors.onSurfaceVariant,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    widget.task == null ? 'newTask'.tr() : 'editTask'.tr(),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      _titleController.clear();
                      _descriptionController.clear();
                      setState(() {
                        _subtasks.clear();
                        _selectedDate = null;
                        _selectedTime = null;
                        _selectedCategory = _categories.first;
                      });
                    },
                    child: Text(
                      'clear'.tr(),
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _titleController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'taskTitle'.tr(),
                  hintText: 'e.g., Finalize presentation slides',
                  prefixIcon: Icon(Icons.task_alt_rounded, size: 20.w),
                ),
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                minLines: 2,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  labelText: 'taskDescription'.tr(),
                  hintText: 'Add notes, links, or description...',
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 40.h),
                    child: Icon(Icons.edit_note_rounded, size: 20.w),
                  ),
                ),
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 20.h),
              Text('category'.tr(), style: theme.textTheme.labelLarge),
              SizedBox(height: 8.h),
             Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: _categories.map((cat) {
            final isSelected = cat == _selectedCategory;
            final theme = Theme.of(context);
            
            return ChoiceChip(
              label: Text(
                cat.tr(), 
                style: TextStyle(
                  fontSize: 13.sp,
                  // تحديد لون النص ديناميكياً ليناسب حالة التحديد والوضع المظلم/المضيء
                  color: isSelected 
                      ? theme.colorScheme.onPrimary 
                      : theme.colorScheme.onSurface,
                ),
              ),
              selected: isSelected,
              // ألوان خلفية الشريحة بحسب الحالة والوضع
              selectedColor: theme.colorScheme.primary,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              surfaceTintColor: Colors.transparent,
              onSelected: (_) => setState(() => _selectedCategory = cat),
              avatar: isSelected
                  ? Icon(
                      Icons.check_rounded, 
                      size: 16.w, 
                      color: theme.colorScheme.onPrimary,
                    )
                  : null,
            );
          }).toList(),
        ), SizedBox(height: 20.h),
              Row(
                children: [
                  Icon(
                    Icons.checklist_rounded,
                    size: 20.w,
                    color: colors.primary,
                  ),
                  SizedBox(width: 8.w),
                  Text('subtasks'.tr(), style: theme.textTheme.titleSmall),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      '${_subtasks.where((s) => s.isCompleted).length}/${_subtasks.length}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _subtaskController,
                      decoration: InputDecoration(
                        hintText: 'addSubtask'.tr(),
                        hintStyle: TextStyle(fontSize: 14.sp),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  IconButton.filled(
                    icon: Icon(Icons.add_rounded, size: 20.w),
                    onPressed: () {
                      final text = _subtaskController.text.trim();
                      if (text.isNotEmpty) {
                        setState(() {
                          _subtasks.add(SubTask(id: _uuid.v4(), title: text));
                          _subtaskController.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: colors.surfaceContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: _subtasks.isEmpty
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Text(
                            'noSubtasks'.tr(),
                            style: TextStyle(
                              color: colors.onSurfaceVariant,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: List.generate(_subtasks.length, (index) {
                          final subtask = _subtasks[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24.w,
                                  height: 24.w,
                                  child: Checkbox(
                                    value: subtask.isCompleted,
                                    onChanged: (val) {
                                      if (val == null) return;
                                      setState(() {
                                        _subtasks[index] = subtask.copyWith(
                                          isCompleted: val,
                                        );
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
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
                                IconButton(
                                  icon: Icon(
                                    Icons.close_rounded,
                                    size: 18.w,
                                    color: colors.onSurfaceVariant,
                                  ),
                                  onPressed: () =>
                                      setState(() => _subtasks.removeAt(index)),
                                  visualDensity: VisualDensity.compact,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
              ),
              SizedBox(height: 20.h),
              Text('reminder'.tr(), style: theme.textTheme.labelLarge),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: Icon(Icons.calendar_month_rounded, size: 18.w),
                      label: Text(
                        _selectedDate != null
                            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                            : 'selectDate'.tr(),
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365 * 5),
                          ),
                        );
                        if (date != null) setState(() => _selectedDate = date);
                      },
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: Icon(Icons.schedule_rounded, size: 18.w),
                      label: Text(
                        _selectedTime != null
                            ? '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
                            : 'selectTime'.tr(),
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: _selectedTime ?? TimeOfDay.now(),
                        );
                        if (time != null) setState(() => _selectedTime = time);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              FilledButton.icon(
                icon: Icon(
                  widget.task == null
                      ? Icons.add_task_rounded
                      : Icons.save_rounded,
                  size: 20.w,
                ),
                label: Text(
                  widget.task == null ? 'createTask'.tr() : 'saveChanges'.tr(),
                  style: TextStyle(fontSize: 15.sp),
                ),
                onPressed: _isSaving ? null : _saveTask,
              ),
              SizedBox(height: 8.h),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colors.onSurfaceVariant,
                  side: BorderSide(color: colors.outline),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: Text('cancel'.tr(), style: TextStyle(fontSize: 15.sp)),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}