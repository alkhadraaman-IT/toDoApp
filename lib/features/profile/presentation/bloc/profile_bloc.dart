import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/notification_service.dart';
import '../../../auth/domain/entities/user_entity.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String? displayName;
  final File? avatarFile;
  const UpdateProfileEvent({this.displayName, this.avatarFile});
  @override
  List<Object?> get props => [displayName, avatarFile];
}

class SignOutEvent extends ProfileEvent {}

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserEntity user;
  const ProfileLoaded(this.user);
  @override
  List<Object?> get props => [user];
}

class ProfileUpdated extends ProfileState {
  final UserEntity user;
  const ProfileUpdated(this.user);
  @override
  List<Object?> get props => [user];
}

class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);
  @override
  List<Object?> get props => [message];
}

class ProfileSignedOut extends ProfileState {}

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;
  final NotificationService _notificationService;

  ProfileBloc({
    FirebaseAuth? firebaseAuth,
    FirebaseStorage? firebaseStorage,
    NotificationService? notificationService,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance,
        _notificationService = notificationService ?? NotificationService(),
        super(ProfileInitial()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<SignOutEvent>(_onSignOut);
  }

  void _onLoadProfile(LoadProfileEvent event, Emitter<ProfileState> emit) {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      emit(ProfileLoaded(_mapUser(user)));
    } else {
      emit(const ProfileError('No user found'));
    }
  }

  Future<void> _onUpdateProfile(UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        emit(const ProfileError('No user found'));
        return;
      }
      if (event.displayName != null && event.displayName!.isNotEmpty) {
        await user.updateDisplayName(event.displayName);
      }
      await user.reload();
      final updatedUser = _firebaseAuth.currentUser;
      if (updatedUser != null) {
        emit(ProfileUpdated(_mapUser(updatedUser)));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<ProfileState> emit) async {
    try {
      final userId = _firebaseAuth.currentUser?.uid;
      if (userId != null) {
        await _notificationService.removeToken(userId);
      }
      await _firebaseAuth.signOut();
      emit(ProfileSignedOut());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  UserEntity _mapUser(User user) {
    return UserEntity(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      photoUrl: user.photoURL,
    );
  }
}
