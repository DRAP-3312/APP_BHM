import 'package:bhm_app/Core/domain/models/login_model.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String userEmail;
  final String password;
  final bool saveSesion;
  final bool isValid;
  final Map<String, String?> errors;

  const LoginState({
    this.userEmail = '',
    this.password = '',
    this.saveSesion = false,
    this.isValid = false,
    this.errors = const {}
  });

  factory LoginState.fromModel(Login model) {
    return LoginState(
      userEmail: model.userEmail,
      password: model.password,
      saveSesion: model.saveSesion,
      isValid: true,
    );
  }

  LoginState copyWith({
    String? userEmail,
    String? password,
    bool? saveSesion,
    bool? isValid,
    Map<String, String?>? errors,
  }) {
    return LoginState(
      userEmail: userEmail ?? this.userEmail,
      password: password ?? this.password,
      saveSesion: saveSesion ?? this.saveSesion,
      isValid: isValid ?? this.isValid,
      errors: errors ?? this.errors,
      
    );
  }

  @override
  List<Object?> get props => [
        userEmail,
        password,
        saveSesion,
        isValid,
        errors
      ];
}

class LoginSuccess extends LoginState {
  LoginSuccess(LoginState state)
      : super(
          userEmail: state.userEmail,
          password: state.password,
          saveSesion: state.saveSesion,
          isValid: true,
          errors: state.errors,
        );
}

class LoginFailure extends LoginState {
  LoginFailure(LoginState state)
      : super(
          userEmail: state.userEmail,
          password: state.password,
          saveSesion: state.saveSesion,
          isValid: false,
          errors: state.errors,
        );
}