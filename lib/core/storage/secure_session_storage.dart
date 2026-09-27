import 'package:firebase_task_1/core/config/di.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../const/app_keys.dart';
import '../models/user_session_model.dart';

class SecureSessionStorage {
  SecureSessionStorage._();

  static SecureSessionStorage? _instund;

  static getInstance() {
    if (_instund == null) {
      _instund = SecureSessionStorage._();
    }
    return _instund;
  }

  
  final FlutterSecureStorage secureStorage=sl.get<FlutterSecureStorage>();
  // SecureSessionStorage({required  this.secureStorage});

  Future<void> saveSession({required UserSessionModel userSession}) async {
    await secureStorage.write(
      key: AppKeys.accessTokenKey,
      value: userSession.accessToken,
    );
    await secureStorage.write(
      key: AppKeys.refreshTokenKey,
      value: userSession.refreshToken,
    );
  }

  Future<UserSessionModel?> getSession() async {
    String? accessToken = await secureStorage.read(key: AppKeys.accessTokenKey);
    String? refreshToken = await secureStorage.read(
      key: AppKeys.refreshTokenKey,
    );
    if (accessToken != null && refreshToken != null) {
      UserSessionModel userSession = UserSessionModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
      return userSession;
    }
    return null;
  }

  Future<void> clearSession() async {
    await secureStorage.delete(key: AppKeys.accessTokenKey);
    await secureStorage.delete(key: AppKeys.refreshTokenKey);
  }
}