import 'package:dartz/dartz.dart' hide Task;

import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

/// حالة استخدام: تسجيل الخروج
class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.signOut();
  }
}
