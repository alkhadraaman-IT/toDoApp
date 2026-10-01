import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_current_user_usecase.dart';
import '../../features/auth/domain/usecases/sign_in_with_email_usecase.dart';
import '../../features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import '../../features/auth/domain/usecases/sign_out_usecase.dart';
import '../../features/auth/domain/usecases/sign_up_with_email_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/task/data/datasources/task_remote_datasource.dart';
import '../../features/task/data/repositories/task_repository_impl.dart';
import '../../features/task/domain/repositories/task_repository.dart';
import '../../features/task/domain/usecases/add_task_usecase.dart';
import '../../features/task/domain/usecases/delete_task_usecase.dart';
import '../../features/task/domain/usecases/get_tasks_usecase.dart';
import '../../features/task/domain/usecases/toggle_subtask_usecase.dart';
import '../../features/task/domain/usecases/update_task_usecase.dart';
import '../../features/task/presentation/bloc/task_bloc.dart';
import '../network/network_info.dart';
import '../theme/theme_cubit.dart';
import 'notification_service.dart';

/// حاوية حقن التبعيات باستخدام GetIt
final sl = GetIt.instance;

/// تهيئة جميع التبعيات
Future<void> initServiceLocator() async {
  // ── الخدمات الأساسية ─────────────────────────────────
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(Connectivity()));
  sl.registerLazySingleton<NotificationService>(
    () => NotificationService(
      messaging: sl<FirebaseMessaging>(),
      firestore: sl<FirebaseFirestore>(),
    ),
  );

  // ── Firebase ──────────────────────────────────────────
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  sl.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);

  // ── مصادر البيانات ──────────────────────────────────
  sl.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskRemoteDataSourceImpl(sl<FirebaseFirestore>()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(firebaseAuth: sl<FirebaseAuth>()),
  );

  // ── المستودعات ───────────────────────────────────────
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(
      remoteDataSource: sl<TaskRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // ── حالات الاستخدام — المهام ─────────────────────────
  sl.registerLazySingleton(() => GetTasksUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton(() => AddTaskUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton(() => UpdateTaskUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton(() => DeleteTaskUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton(() => ToggleSubtaskUseCase(sl<TaskRepository>()));

  // ── حالات الاستخدام — المصادقة ───────────────────────
  sl.registerLazySingleton(() => SignInWithEmailUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignUpWithEmailUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignInWithGoogleUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignOutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl<AuthRepository>()));
  // ── وحدات BLoC / Cubit ────────────────────────────────
  sl.registerFactory<TaskBloc>(
    () => TaskBloc(repository: sl<TaskRepository>(), notificationService: sl<NotificationService>()),
  );
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      repository: sl<AuthRepository>(),
      notificationService: sl<NotificationService>(),
    ),
  );
  sl.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      firebaseAuth: sl<FirebaseAuth>(),
      firebaseStorage: sl<FirebaseStorage>(),
      notificationService: sl<NotificationService>(),
    ),
  );
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
