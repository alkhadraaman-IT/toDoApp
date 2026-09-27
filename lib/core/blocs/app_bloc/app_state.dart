part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class AppLoading extends AppState {}

final class AppFailure extends AppState {}

final class Authenticated extends AppState {}

final class UnAuthenticated extends AppState {}

final class ShowOnboarding extends AppState {}