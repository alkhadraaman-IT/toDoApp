import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';

/// حالات المصادقة
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// ابتدائي
class AuthInitial extends AuthState {}

/// جاري التحميل
class AuthLoading extends AuthState {}

/// تم تسجيل الدخول
class Authenticated extends AuthState {
  final UserEntity user;

  const Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

/// لم يتم تسجيل الدخول
class Unauthenticated extends AuthState {}

/// خطأ في المصادقة
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
