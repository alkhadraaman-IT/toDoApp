// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../core/config/di.dart';
import '../core/models/user_session_model.dart';
import '../core/storage/app_prefrences.dart';
import '../core/storage/secure_session_storage.dart';
import '../datasouecses/auth_datasourcs.dart';
import '../models/login_model.dart';

class AuthRepo {
  SecureSessionStorage secureSessionStorage;
  AppPrefrences appPrefrences;
  AuthDatasourcs authDatasourcs=sl.get<AuthDatasourcs>();
  // Dio dio;
  AuthRepo({
    required this.secureSessionStorage,
    required this.appPrefrences,
  });


  Future<void> login({required LoginModel loginModel}) async {
    return authDatasourcs.login(loginModel: loginModel,);
  }

  Future<void> register({required LoginModel loginModel}) async {
   return authDatasourcs.register(loginModel: loginModel);
  }

  Future<void> logout() async {
    return authDatasourcs.logout();
  }

  bool isCompleteOnboarding() {
    return appPrefrences.isOnboardingCompleted();
  }

  Future<void> completeOnboarding() {
    return appPrefrences.completeOnboarding();
  }

  Future<bool> restoreSession() async {
    UserSessionModel? userSession = await secureSessionStorage.getSession();
    return userSession != null ? true : false;
  }
  
}
