import 'package:equatable/equatable.dart';

abstract class RegistroLoginEvent extends Equatable {
  const RegistroLoginEvent();

  @override
  List<Object?> get props => [];
}

class LoadRegistroLoginDataEvent extends RegistroLoginEvent {}

class NameChanged extends RegistroLoginEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class LastNameChanged extends RegistroLoginEvent {
  final String lastname;

  const LastNameChanged(this.lastname);

  @override
  List<Object?> get props => [lastname];
}

class EmailChanged extends RegistroLoginEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class RfcChanged extends RegistroLoginEvent {
  final String rfc;

  const RfcChanged(this.rfc);

  @override
  List<Object?> get props => [rfc];
}

class PhoneChanged extends RegistroLoginEvent {
  final String phone;

  const PhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class PassowordChanged extends RegistroLoginEvent {
  final String password;

  const PassowordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class IdbanckChanged extends RegistroLoginEvent {
  final int id_banck;

  const IdbanckChanged(this.id_banck);

  @override
  List<Object?> get props => [id_banck];
}

class RegistroLoginSubmitted extends RegistroLoginEvent {}

class RegistroLoginSuccess extends RegistroLoginEvent {}

class RegistroLoginFailure extends RegistroLoginEvent {}
