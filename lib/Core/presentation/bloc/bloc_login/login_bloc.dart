import 'package:bhm_app/Core/domain/models/login_model.dart';
import 'package:bhm_app/Core/domain/usecases/load_login_data.dart' as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/domain/repositories/login_Repositorie.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final usecase.LoadLoginData loadLoginData;
  final LoginRepository repository;

  LoginBloc(this.loadLoginData, this.repository) : super(const LoginState()) {
    on<LoadLoginDataEvent>((event, emit) async {
      final loginData = await loadLoginData();
      emit(LoginState.fromModel(loginData));
    });

    on<UserEmailChanged>((event, emit) {
      emit(state.copyWith(userEmail: event.userEmail, isValid: _validateForm()));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, isValid: _validateForm()));
    });

    on<SaveSesionChanged>((event, emit) {
      emit(state.copyWith(saveSesion: event.saveSesion, isValid: _validateForm()));
    });

    on<LoginSubmitted>((event, emit) async {
      if (state.isValid) {
        final login = Login(
          userEmail: state.userEmail,
          password: state.password,
          saveSesion: state.saveSesion,
        );

        final success = await repository.singIn(login);

        if (success) {
          emit(LoginSuccess(state));
        } else {
          emit(LoginFailure(state));
        }
      }
    });
  }

  bool _validateForm() {
    return state.userEmail.isNotEmpty && state.password.isNotEmpty;
  }
}
