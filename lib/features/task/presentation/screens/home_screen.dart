import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/notification_service.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import '../bloc/task_state.dart';
import '../widgets/add_edit_task_sheet.dart';
import '../widgets/category_chips.dart';
import '../../../../features/profile/presentation/screens/profile_screen.dart';
import '../widgets/profile_header.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  final String userId;
  const HomeScreen({super.key, required this.userId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchFocusNode = FocusNode();

  Future<void> _setupNotifications() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final notificationService = NotificationService();
      await notificationService.initFcm(user.uid);
    }
  }

  @override
  void initState() {
    super.initState();
    _setupNotifications();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final uid = FirebaseAuth.instance.currentUser?.uid;
        if (uid != null) {
          context.read<TaskBloc>().add(WatchTasksEvent(userId: uid));
        }
      }
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ProfileHeader(
                      onSearchTap: () {
                        _searchFocusNode.requestFocus();
                      },
                      onProfileTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileScreen(),
                          ),
                        );
                      },
                      onThemeToggle: () {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                    child: SearchBarWidget(
                      hint: 'searchTasks'.tr(),
                      focusNode: _searchFocusNode,
                      onChanged: (value) {
                        context.read<TaskBloc>().add(SearchTasksEvent(value));
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: CategoryChips(
                      categories: const [
                        'all',
                        'work',
                        'home',
                        'personal_development',
                        'health',
                        'other',
                      ],
                      selected: state is TaskLoaded
                          ? state.selectedCategory
                          : 'all',
                      onSelected: (cat) {
                        context.read<TaskBloc>().add(
                          FilterByCategoryEvent(cat),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'focusQueue'.tr(),
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: colors.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            state is TaskLoaded
                                ? '${state.filteredTasks.length}'
                                : '0',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is TaskLoading)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 48.h),
                        child: CircularProgressIndicator(strokeWidth: 2.w),
                      ),
                    ),
                  )
                else if (state is TaskLoaded)
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 100.h),
                    sliver: TaskList(
                      tasks: state.filteredTasks,
                      onToggleSubtask: (taskId, subtaskId) {
                        context.read<TaskBloc>().add(
                          ToggleSubTaskEvent(taskId, subtaskId),
                        );
                      },
                      onDelete: (taskId) {
                        context.read<TaskBloc>().add(DeleteTaskEvent(taskId));
                      },
                      onEdit: (task) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<TaskBloc>(context),
                            child: AddEditTaskSheet(task: task),
                          ),
                        );
                      },
                    ),
                  )
                else if (state is TaskError)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 48.h),
                        child: Column(
                          children: [
                            Icon(
                              Icons.error_outline_rounded,
                              size: 48.w,
                              color: colors.error,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              state.message,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<TaskBloc>(context),
              child: const AddEditTaskSheet(),
            ),
          );
        },
        icon: Icon(Icons.add_rounded, size: 24.w),
        label: Text(
          'newTask'.tr(),
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
