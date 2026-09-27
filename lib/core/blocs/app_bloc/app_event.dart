part of 'app_bloc.dart';




@immutable
sealed class AppEvent {}

final class AppStarted extends AppEvent {}

final class Login extends AppEvent {
  final LoginModel loginModel;

  Login({required this.loginModel});
}

final class Register extends AppEvent {
  final LoginModel loginModel;

  Register({required this.loginModel});
}

final class Logout extends AppEvent {}

final class CompleteOnboarding extends AppEvent {}