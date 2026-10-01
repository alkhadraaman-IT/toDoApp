import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/notification_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// وحدة إدارة حالة المصادقة (BLoC)
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final NotificationService notificationService;
  StreamSubscription<UserEntity?>? _authSubscription;

  AuthBloc({
    required this.repository,
    required this.notificationService,
  }) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<GoogleSignInEvent>(_onGoogleSignIn);
    on<SignOutEvent>(_onSignOut);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);

    _authSubscription = repository.authStateChanges.listen((user) {
      if (user != null) {
        add(CheckAuthStatusEvent());
      }
    });
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await repository.signInWithEmail(event.email, event.password);
    result.fold(
      (failure) {
        log('SignIn failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (user) {
        log('SignIn success: ${user.email}');
        _initFcm(user.id);
        emit(Authenticated(user));
      },
    );
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await repository.signUpWithEmail(event.email, event.password, event.displayName);
    result.fold(
      (failure) {
        log('SignUp failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (user) {
        log('SignUp success: ${user.email}');
        _initFcm(user.id);
        emit(Authenticated(user));
      },
    );
  }

  Future<void> _onGoogleSignIn(GoogleSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await repository.signInWithGoogle();
    result.fold(
      (failure) {
        log('Google SignIn failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (user) {
        log('Google SignIn success: ${user.email}');
        _initFcm(user.id);
        emit(Authenticated(user));
      },
    );
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await repository.signOut();
    result.fold(
      (failure) {
        log('SignOut failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (_) {
        log('SignOut success');
        emit(Unauthenticated());
      },
    );
  }

  void _onCheckAuthStatus(CheckAuthStatusEvent event, Emitter<AuthState> emit) {
    final user = repository.getCurrentUser();
    if (user != null) {
      log('Auth status: Authenticated as ${user.email}');
      emit(Authenticated(user));
    } else {
      log('Auth status: Unauthenticated');
      emit(Unauthenticated());
    }
  }

  /// تهيئة FCM وحفظ الـ Token في Firestore
  Future<void> _initFcm(String userId) async {
if (!kIsWeb) {
  await notificationService.initFcm(userId);
}  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
