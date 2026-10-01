import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';

/// ترويسة الصفحة الرئيسية — شعار التطبيق والتحية وأزرار الإجراءات
class ProfileHeader extends StatelessWidget {
  final VoidCallback onSearchTap;
  final VoidCallback onProfileTap;
  final VoidCallback onThemeToggle;

  const ProfileHeader({
    super.key,
    required this.onSearchTap,
    required this.onProfileTap,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    // الحصول على اسم المستخدم من AuthBloc
    final authState = context.watch<AuthBloc>().state;
    final userName = authState is Authenticated
        ? (authState.user.displayName.isNotEmpty
            ? authState.user.displayName
            : authState.user.email.split('@')[0])
        : 'user'.tr();

    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
      child: Row(
        children: [
          // ── شعار التطبيق ──────────────────────────────
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                shape: BoxShape.circle,
                border: Border.all(color: colors.outlineVariant, width: 1),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.jpg',
                  width: 32.w,
                  height: 32.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // ── التحية ───────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'hello'.tr(),
                  style: theme.textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
                ),
                Text(
                  userName,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // ── زر البحث ─────────────────────────────────
          // _HeaderIconButton(icon: Icons.search_rounded, onTap: onSearchTap),

          // SizedBox(width: 8.w),

          // ── زر تبديل الثيم ───────────────────────────
          _HeaderIconButton(icon: Icons.dark_mode_outlined, onTap: onThemeToggle),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(14.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: Container(
          width: 44.w,
          height: 44.w,
          alignment: Alignment.center,
          child: Icon(icon, size: 22.w, color: colors.onSurfaceVariant),
        ),
      ),
    );
  }
}
