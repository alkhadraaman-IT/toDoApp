import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../datasouecses/auth_datasourcs.dart';
import '../storage/secure_session_storage.dart';

GetIt sl = GetIt.instance;

Future<void> setup() async {
  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  sl.registerSingleton<AuthDatasourcs>(AuthDatasourcs.getInstance());
  sl.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  sl.registerSingleton<SecureSessionStorage>(
    SecureSessionStorage.getInstance(),
  );
}
