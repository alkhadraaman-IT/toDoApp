import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task_1/core/blocs/app_bloc/app_bloc.dart';
import 'package:firebase_task_1/core/config/di.dart';
import 'package:firebase_task_1/core/storage/secure_session_storage.dart';

import '../core/const/app_keys.dart';
import '../models/login_model.dart';


class AuthDatasourcs {
  // final Dio dio;
  late Response response;
  AuthDatasourcs._();

  static AuthDatasourcs? _instund;

  static getInstance() {
    if (_instund == null) {
      _instund = AuthDatasourcs._();
    }
    return _instund;
  }

  // new({required this.dio});

  // Future<bool> login({required LoginModel loginInfo}) async {
  login({required LoginModel loginModel}) async {
    //   try {
    //     response = await dio.post(
    //       '${AppKeys.baseUrl}/${AppKeys.loginEndpoint}',
    //       data: loginInfo.toMap(),
    //     );
    //     if (response.statusCode == 200) {
    //       print('--------------------sec-----------------');
    //       print(response.data['token']);
    //       token = response.data['token'];
    //       print('--------------------sec-----------------');
    //       return true;
    //     } else {
    //       return false;
    //     }
    //   } catch (e) {
    //     print(e);
    //     return false;
    //   }
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    sl.get<SecureSessionStorage>().clearSession();
  }

  register({required LoginModel loginModel}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: loginModel.email,
            password: loginModel.password,
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
