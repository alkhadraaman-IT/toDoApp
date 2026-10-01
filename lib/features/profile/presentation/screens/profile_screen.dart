import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../auth/presentation/screens/auth_screen.dart';
import '../../../task/data/models/task_model.dart';
import '../bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(LoadProfileEvent()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              final user = switch (state) {
                ProfileLoaded() => state.user,
                ProfileUpdated() => state.user,
                _ => null,
              };

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_rounded, size: 24.w),
                          onPressed: () => Navigator.pop(context),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'profile'.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Center(
                      child: Container(
                        width: 112.w,
                        height: 112.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outlineVariant,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary
                                  .withValues(alpha: 0.15),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/logo.jpg',
                            width: 72.w,
                            height: 72.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      user?.displayName ?? 'user'.tr(),
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      user?.email ?? '',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.verified_user_rounded,
                            size: 16.w,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'firebaseVerified'.tr(),
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerLow,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                        ),
                      ),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser?.uid)
                            .collection(
                              'tasks',
                            ) // Access subcollection for current user
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          final docs = snapshot.data?.docs ?? [];
                          final totalTasks = docs.length;

                          // تحويل المستندات إلى الموديل باستخدام data()
                          final tasks = docs.map((doc) => TaskModel.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();

                          // حساب المهام المكتملة بكل سهولة
                          final completedCount = tasks
                              .where((task) => task.isCompleted == true)
                              .length;

                          // حساب المهام النشطة
                          final activeCount = totalTasks - completedCount;

                          return Row(
                            children: [
                              _StatItem(
                                icon: Icons.task_alt_rounded,
                                value: '$completedCount',
                                label: 'completed'.tr(),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              _StatDivider(),
                              _StatItem(
                                icon: Icons.pending_actions_rounded,
                                value: '$activeCount',
                                label: 'active'.tr(),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              _StatDivider(),
                              _StatItem(
                                icon: Icons.list_alt_rounded,
                                value: '$totalTasks',
                                label: 'total'.tr(),
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'preferences'.tr(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerLow,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: _SettingsIcon(icon: Icons.palette_rounded),
                            title: Text(
                              'darkMode'.tr(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: Text(
                              'lightDark'.tr(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: Switch(
                              value:
                                  Theme.of(context).brightness ==
                                  Brightness.dark,
                              onChanged: (_) {
                                context.read<ThemeCubit>().toggleTheme();
                              },
                            ),
                          ),
                          _SettingsDivider(),
                          ListTile(
                            leading: _SettingsIcon(
                              icon: Icons.cloud_sync_rounded,
                            ),
                            title: Text(
                              'cloudSync'.tr(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: Text(
                              'syncStatus'.tr(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 6.w,
                                    height: 6.w,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'autoSync'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _SettingsDivider(),
                          ListTile(
                            leading: _SettingsIcon(
                              icon: Icons.notifications_active_rounded,
                            ),
                            title: Text(
                              'notifications'.tr(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: Text(
                              'notificationLead'.tr(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: Icon(
                              Icons.chevron_right_rounded,
                              size: 20.w,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text('notifications'.tr()),
                                  content: Text('notificationLead'.tr()),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: Text('ok'.tr()),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          _SettingsDivider(),
                          ListTile(
                            leading: _SettingsIcon(
                              icon: Icons.language_rounded,
                            ),
                            title: Text(
                              'language'.tr(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: Text(
                              context.locale.languageCode == 'ar'
                                  ? 'العربية'
                                  : 'English',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: Switch(
                              value: context.locale.languageCode == 'en',
                              onChanged: (_) {
                                final newLocale =
                                    context.locale.languageCode == 'en'
                                    ? const Locale('ar')
                                    : const Locale('en');
                                context.setLocale(newLocale);
                                SharedPreferences.getInstance().then((prefs) {
                                  prefs.setString(
                                    'app_language',
                                    newLocale.languageCode,
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'account'.tr(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    // SizedBox(height: 8.h),
                    // OutlinedButton.icon(
                    //   icon: Icon(
                    //     Icons.download_rounded,
                    //     size: 20.w,
                    //     color: Theme.of(context).colorScheme.primary,
                    //   ),
                    //   label: Text('exportTasks'.tr()),
                    //   style: OutlinedButton.styleFrom(
                    //     minimumSize: const Size(double.infinity, 48),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(24.r),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text('exportNotImplemented'.tr())),
                    //     );
                    //   },
                    // ),
                    SizedBox(height: 12.h),
                    FilledButton.icon(
                      icon: Icon(
                        Icons.logout_rounded,
                        size: 20.w,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                      label: Text(
                        'logout'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onError,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .errorContainer,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                      onPressed: () {
                        context.read<ProfileBloc>().add(SignOutEvent());
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const AuthScreen()),
                          (route) => false,
                        );
                      },
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'version'.tr(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SettingsIcon extends StatelessWidget {
  final IconData icon;
  const _SettingsIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        icon,
        size: 20.w,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 72.w,
      color: Theme.of(context).colorScheme.surfaceVariant,
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 24.w, color: color),
          SizedBox(height: 4.h),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 40.h,
      color: Theme.of(context).colorScheme.surfaceVariant,
    );
  }
}
