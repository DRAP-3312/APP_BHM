// import 'package:bhm_app/Core/domain/models/login_model.dart';
// import 'package:bhm_app/Core/domain/usecases/load_login_data.dart' as usecase;
// import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_event.dart';
// import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bhm_app/Core/domain/repositories/login_Repositorie.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final usecase.LoadLoginData loadLoginData;
//   final LoginRepository repository;

//   LoginBloc(this.loadLoginData, this.repository) : super(const LoginState()) {
//     on<LoadLoginDataEvent>((event, emit) async {
//       final loginData = await loadLoginData();
//       emit(LoginState.fromModel(loginData));
//     });

//     on<UserEmailChanged>((event, emit) {
//       emit(state.copyWith(userEmail: event.userEmail, isValid: _validateForm()));
//     });

//     on<PasswordChanged>((event, emit) {
//       emit(state.copyWith(password: event.password, isValid: _validateForm()));
//     });

//     on<SaveSesionChanged>((event, emit) {
//       emit(state.copyWith(saveSesion: event.saveSesion, isValid: _validateForm()));
//     });

//     on<LoginSubmitted>((event, emit) async {
//       if (state.isValid) {
//         final login = Login(
//           userEmail: state.userEmail,
//           password: state.password,
//           saveSesion: state.saveSesion,
//         );

//         final success = await repository.singIn(login);

//         if (success) {
//           emit(LoginSuccess(state));
//         } else {
//           emit(LoginFailure(state));
//         }
//       }
//     });
//   }

//   bool _validateForm() {
//     return state.userEmail.isNotEmpty && state.password.isNotEmpty;
//   }
// }


import 'package:bhm_app/Core/domain/models/login_model.dart';
import 'package:bhm_app/Core/domain/repositories/login_Repositorie.dart';
import 'package:bhm_app/Core/domain/usecases/load_login_data.dart' as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final usecase.LoadLoginData loadLoginData;
  final LoginRepository repository;

  LoginBloc(this.loadLoginData, this.repository) : super(const LoginState()) {
    on<UserEmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
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
    on<LoadLoginDataEvent>((event, emit) async {
      final loginData = await loadLoginData();
      emit(LoginState.fromModel(loginData));
    });
  }

void _onEmailChanged(UserEmailChanged event, Emitter<LoginState> emit) {
  final phone = event.userEmail;
  String? errorMessage;

  if (phone.isEmpty) {
    errorMessage = 'El Usuario no puede estar vacío.';
  } else if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
    errorMessage = 'Ingrese un número de teléfono válido de 10 dígitos.';
  }

  emit(state.copyWith(
    userEmail: phone,
    errors: {...state.errors, 'userEmail': errorMessage},
    isValid: _validateForm(),
  ));
}


void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
  final password = event.password;
  String? errorMessage;

  if (password.isEmpty) {
    errorMessage = 'La contraseña no puede estar vacía.';
  } else if (password.length < 8) {
    errorMessage = 'La contraseña debe tener al menos 8 caracteres.';
  } else if (!RegExp(r'^(?=.[A-Z])(?=.[a-z]).{8,}$').hasMatch(password)) {
    errorMessage =
        'La contraseña debe contener al menos una letra mayúscula y una letra minúscula.';
  }

  emit(state.copyWith(
    password: password,
    errors: {...state.errors, 'password': errorMessage},
    isValid: _validateForm(),
  ));
}


  bool _validateForm() {
    return state.userEmail.isNotEmpty &&
           state.password.isNotEmpty &&
           state.errors.values.every((error) => error == null);
  }
}