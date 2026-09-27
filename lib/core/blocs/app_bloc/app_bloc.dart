// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/login_model.dart';
import '../../../repos/auth_repo.dart';
part 'app_event.dart';
part 'app_state.dart';




class AppBloc extends Bloc<AppEvent, AppState> {
  AuthRepo authRepo;
  AppBloc({required this.authRepo}) : super(AppInitial()) {
    on<AppStarted>((event, emit) async {
      if (authRepo.isCompleteOnboarding()) {
        if (await authRepo.restoreSession()) {
          emit(Authenticated());
        } else {
          emit(UnAuthenticated());
        }
      } else {
        emit(ShowOnboarding());
      }
    });

    on<Login>((event, emit) async {
      emit(AppLoading());
      try {
        await authRepo.login(loginModel: event.loginModel);
        emit(Authenticated());
      } catch (e) {
        emit(UnAuthenticated());
      }
    });

    on<Register>((event, emit) async {
      await authRepo.register(loginModel: event.loginModel);
      emit(Authenticated());
    });

    on<Logout>((event, emit) async {
      await authRepo.logout();
      emit(UnAuthenticated());
    });

    on<CompleteOnboarding>((event, emit) async {
      await authRepo.completeOnboarding();
      emit(UnAuthenticated());
    });
  }
}