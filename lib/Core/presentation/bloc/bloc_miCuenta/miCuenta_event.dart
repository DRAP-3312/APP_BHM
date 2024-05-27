import 'package:equatable/equatable.dart';

abstract class MiCuentaEvent extends Equatable {
  const MiCuentaEvent();

  @override
  List<Object?> get props => [];
}

class LoadMiCuentaDataEvent extends MiCuentaEvent {}


class NumCuentaChanged extends MiCuentaEvent {
  final String numCuenta;

  const NumCuentaChanged(this.numCuenta);

  @override
  List<Object?> get props => [numCuenta];
}

class UserChanged extends MiCuentaEvent {
  final String user;

  const UserChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class CellChanged extends MiCuentaEvent {
  final String cell;

  const CellChanged(this.cell);

  @override
  List<Object?> get props => [cell];
}

class UserEmailcChanged extends MiCuentaEvent {
  final String userEmail;

  const UserEmailcChanged(this.userEmail);

  @override
  List<Object?> get props => [userEmail];
}

class FotoPerfilChanged extends MiCuentaEvent {
  final String fotoPerfil;

  const FotoPerfilChanged(this.fotoPerfil);

  @override
  List<Object?> get props => [fotoPerfil];
}


class MiCuentaSubmitted extends MiCuentaEvent {}
