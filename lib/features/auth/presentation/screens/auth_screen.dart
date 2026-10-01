import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/toast_util.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../features/task/presentation/bloc/task_bloc.dart';
import '../../../../features/task/presentation/screens/home_screen.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  bool get _isSignUp => _tabController.index == 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) => sl<TaskBloc>(param1: state.user.id),
                    child: HomeScreen(userId: state.user.id),
                  ),
                ),
                (route) => false,
              );
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
              // ToastUtil.showError(state.message);
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 48.h),
                _buildLogo(context),
                SizedBox(height: 24.h),
                _buildTabBar(context),
                SizedBox(height: 32.h),
                _buildForm(context),
                SizedBox(height: 24.h),
                _buildGoogleSignInButton(context),
                SizedBox(height: 16.h),
                _buildFooter(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(color: colors.primaryContainer, borderRadius: BorderRadius.circular(40.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.r),
            child: Image.asset('assets/logo.jpg', width: 40.w, height: 40.w, fit: BoxFit.contain),
          ),
        ),
        SizedBox(height: 16.h),
        Text('appTitle'.tr(), style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 4.h),
        Text('splashSubtitle'.tr(), style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant)),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(24.r)),
      child: Row(
        children: [
          Expanded(child: _TabButton(label: 'signIn'.tr(), selected: !_isSignUp, onTap: () => _tabController.animateTo(0))),
          Expanded(child: _TabButton(label: 'signUp'.tr(), selected: _isSignUp, onTap: () => _tabController.animateTo(1))),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Column(
          children: [
            if (_isSignUp) ...[
              _buildTextField(context, controller: _nameController, label: 'fullName'.tr(), icon: Icons.person_outline),
              SizedBox(height: 12.h),
            ],
            _buildTextField(context, controller: _emailController, label: 'email'.tr(), icon: Icons.mail_outline),
            SizedBox(height: 12.h),
            _buildTextField(context, controller: _passwordController, label: 'password'.tr(), icon: Icons.lock_outline, isPassword: true),
            SizedBox(height: 24.h),
            FilledButton(
              onPressed: isLoading
                  ? null
                  : () {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();
                      if (_isSignUp) {
                        final name = _nameController.text.trim();
                        context.read<AuthBloc>().add(SignUpEvent(email, password, name));
                      } else {
                        context.read<AuthBloc>().add(SignInEvent(email, password));
                      }
                    },
              child: isLoading
                  ? SizedBox(width: 24.w, height: 24.w, child: CircularProgressIndicator(strokeWidth: 2.w))
                  : Text(_isSignUp ? 'signUp'.tr() : 'signIn'.tr()),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(BuildContext context, {required TextEditingController controller, required String label, required IconData icon, bool isPassword = false}) {
    final colors = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      obscureText: isPassword && !_isPasswordVisible,
      keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20.w),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(_isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined, size: 20.w),
                onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: colors.outline)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: colors.outline)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide(color: colors.primary, width: 2)),
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return OutlinedButton(
          onPressed: isLoading ? null : () => context.read<AuthBloc>().add(GoogleSignInEvent()),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Theme.of(context).colorScheme.outline),
            padding: EdgeInsets.symmetric(vertical: 12.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.g_mobiledata, size: 24.w, color: Theme.of(context).colorScheme.onSurface),
              SizedBox(width: 8.w),
              Text('continueWithGoogle'.tr()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    return TextButton(
      onPressed: () => _tabController.animateTo(_isSignUp ? 0 : 1),
      child: Text(_isSignUp ? 'haveAccount'.tr() : 'noAccount'.tr()),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _TabButton({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: selected ? colors.surfaceContainerLowest : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: selected ? [BoxShadow(color: colors.shadow.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 2))] : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(fontSize: 14.sp, fontWeight: selected ? FontWeight.w600 : FontWeight.w400, color: selected ? colors.onSurface : colors.onSurfaceVariant),
        ),
      ),
    );
  }
}
