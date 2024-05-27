import 'package:equatable/equatable.dart';

abstract class InicioEvent extends Equatable {
  const InicioEvent();

  @override
  List<Object?> get props => [];
}

class LoadInicioDataEvent extends InicioEvent {}

class UserNameChanged extends InicioEvent {
  final String userName;

  const UserNameChanged(this.userName);

  @override
  List<Object?> get props => [userName];
}

class NumTarjetChanged extends InicioEvent {
  final String numTarjet;

  const NumTarjetChanged(this.numTarjet);

  @override
  List<Object?> get props => [numTarjet];
}

// ignore: camel_case_types
class cvcChanged extends InicioEvent {
  final int cvc;

  const cvcChanged(this.cvc);

  @override
  List<Object?> get props => [cvc];
}

class NewsChanged extends InicioEvent {
  final String news;

  const NewsChanged(this.news);

  @override
  List<Object?> get props => [news];
}

class FotoUserChanged extends InicioEvent {
  final String fotoUser;

  const FotoUserChanged(this.fotoUser);

  @override
  List<Object?> get props => [fotoUser];
}

class FotoNewChanged extends InicioEvent {
  final String fotoNews;

  const FotoNewChanged(this.fotoNews);

  @override
  List<Object?> get props => [fotoNews];
}

class InicioSubmitted extends InicioEvent {}
