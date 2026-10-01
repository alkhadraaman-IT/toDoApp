import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

/// واجهة مستودع المصادقة
abstract class AuthRepository {
  /// تسجيل الدخول بالبريد وكلمة المرور
  Future<Either<Failure, UserEntity>> signInWithEmail(String email, String password);

  /// إنشاء حساب جديد
  Future<Either<Failure, UserEntity>> signUpWithEmail(String email, String password, String displayName);

  /// تسجيل الدخول عبر Google
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  /// تسجيل الخروج
  Future<Either<Failure, void>> signOut();

  /// الحصول على المستخدم الحالي
  UserEntity? getCurrentUser();

  /// بث حالة المصادقة
  Stream<UserEntity?> get authStateChanges;
}
