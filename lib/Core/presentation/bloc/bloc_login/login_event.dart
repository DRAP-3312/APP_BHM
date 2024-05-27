import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoadLoginDataEvent extends LoginEvent {}

class UserEmailChanged extends LoginEvent {
  final String userEmail;

  const UserEmailChanged(this.userEmail);

  @override
  List<Object?> get props => [userEmail];
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}


class SaveSesionChanged extends LoginEvent {
  final bool saveSesion;

  const SaveSesionChanged(this.saveSesion);

  @override
  List<Object?> get props => [saveSesion];
}


class LoginSubmitted extends LoginEvent {}
