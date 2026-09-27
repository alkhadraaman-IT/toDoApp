import 'package:shared_preferences/shared_preferences.dart';

import '../config/di.dart';
import '../const/app_keys.dart';

class AppPrefrences {
  AppPrefrences._();

  static AppPrefrences? _instund;

  static getInstance() {
    if (_instund == null) {
      _instund = AppPrefrences._();
    }
    return _instund;
  }

  final SharedPreferences sharedPreferences=  sl.get<SharedPreferences>();

  // AppPrefrences({required this.sharedPreferences});

  Future<void> completeOnboarding() async {
    await sharedPreferences.setBool(AppKeys.isFirstTimeKey, true);
  }

  bool isOnboardingCompleted() {
    bool isCompleted =
        sharedPreferences.getBool(AppKeys.isFirstTimeKey) ?? false;
    return isCompleted;
  }
}