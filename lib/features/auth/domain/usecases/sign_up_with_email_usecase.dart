import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// حالة استخدام: إنشاء حساب جديد
class SignUpWithEmailUseCase {
  final AuthRepository repository;

  SignUpWithEmailUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(String email, String password, String displayName) {
    return repository.signUpWithEmail(email, password, displayName);
  }
}
