import 'package:equatable/equatable.dart';

/// أحداث المصادقة
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// تسجيل الدخول بالبريد وكلمة المرور
class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

/// إنشاء حساب جديد
class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String displayName;

  const SignUpEvent(this.email, this.password, this.displayName);

  @override
  List<Object?> get props => [email, password, displayName];
}

/// تسجيل الدخول عبر Google
class GoogleSignInEvent extends AuthEvent {}

/// تسجيل الخروج
class SignOutEvent extends AuthEvent {}

/// التحقق من حالة المصادقة
class CheckAuthStatusEvent extends AuthEvent {}
