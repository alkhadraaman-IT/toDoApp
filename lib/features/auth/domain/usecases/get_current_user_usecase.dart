import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// حالة استخدام: الحصول على المستخدم الحالي
class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  UserEntity? call() {
    return repository.getCurrentUser();
  }
}
