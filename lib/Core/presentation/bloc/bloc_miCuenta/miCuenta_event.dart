import 'package:equatable/equatable.dart';

abstract class MiCuentaEvent extends Equatable {
  const MiCuentaEvent();

  @override
  List<Object> get props => [];
}

class LoadMiCuentaDataEvent extends MiCuentaEvent {}

class NameChanged extends MiCuentaEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class LastnameChanged extends MiCuentaEvent {
  final String lastname;

  const LastnameChanged(this.lastname);

  @override
  List<Object> get props => [lastname];
}

class PhoneChanged extends MiCuentaEvent {
  final String phone;

  const PhoneChanged(this.phone);

  @override
  List<Object> get props => [phone];
}

class EmailChanged extends MiCuentaEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class RfcChanged extends MiCuentaEvent {
  final String rfc;

  const RfcChanged(this.rfc);

  @override
  List<Object> get props => [rfc];
}

class PasswordChanged extends MiCuentaEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class IdBankChanged extends MiCuentaEvent {
  final int id_bank;

  const IdBankChanged(this.id_bank);

  @override
  List<Object> get props => [id_bank];
}

class MiCuentaSubmitted extends MiCuentaEvent {}
