import 'package:firebase_task_1/views/register_view.dart';

import '/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/theme/theme_app.dart';
import '/views/home_view.dart';
import '/views/onboarding_view.dart';
import '/views/splash_view.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/blocs/app_bloc/app_bloc.dart';
import 'core/config/di.dart';
import 'core/storage/app_prefrences.dart';
import 'core/storage/secure_session_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});
  @override
  Widget build(BuildContext context) {
    // getIt.get<SharedPreferences>().clear();
    return BlocProvider(
      create: (context) => AppBloc(
        authRepo: AuthRepo(
          secureSessionStorage: sl.get<SecureSessionStorage>(),
          appPrefrences: sl.get<AppPrefrences>()
        ),
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeApp.liteTheme,
            home: HomeView());
        },
      ),
    );
  }
}