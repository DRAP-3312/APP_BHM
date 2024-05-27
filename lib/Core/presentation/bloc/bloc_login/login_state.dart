import 'package:bhm_app/Core/domain/models/login_model.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String userEmail;
  final String password;
  final bool saveSesion;
  final bool isValid;

  const LoginState({
    this.userEmail = '',
    this.password = '',
    this.saveSesion = false,
    this.isValid = false,
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
  }) {
    return LoginState(
      userEmail: userEmail ?? this.userEmail,
      password: password ?? this.password,
      saveSesion: saveSesion ?? this.saveSesion,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        userEmail,
        password,
        saveSesion,
        isValid,
      ];
}
