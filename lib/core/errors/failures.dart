/// فشل أساسي مجرد لجميع أخطاء النطاق
abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

/// فشل في الاتصال بالشبكة
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'لا يوجد اتصال بالإنترنت']);
}

/// فشل في المصادقة
class AuthFailure extends Failure {
  const AuthFailure([super.message = 'فشلت المصادقة']);
}

/// فشل في قاعدة البيانات
class DatabaseFailure extends Failure {
  const DatabaseFailure([super.message = 'حدث خطأ في قاعدة البيانات']);
}

/// فشل غير متوقع
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'حدث خطأ غير متوقع']);
}
