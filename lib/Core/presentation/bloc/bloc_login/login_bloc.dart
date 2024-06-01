import 'package:bhm_app/Core/domain/usecases/load_login_data.dart' as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final usecase.LoadLoginData loadLoginData;

  
  LoginBloc(this.loadLoginData) : super(const LoginState()) {
    on<LoadLoginDataEvent>((event, emit) async {
      final loginData = await loadLoginData();
      emit(LoginState.fromModel(loginData));
    });

    on<UserEmailChanged>((event, emit) {
      emit(
          state.copyWith(userEmail: event.userEmail, isValid: _validateForm()));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, isValid: _validateForm()));
    });
    on<SaveSesionChanged>((event, emit) {
      emit(state.copyWith(
          saveSesion: event.saveSesion, isValid: _validateForm()));
    });

    on<LoginSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.userEmail.isNotEmpty &&
        state.password.isNotEmpty &&
        state.saveSesion == false;
  }
}
