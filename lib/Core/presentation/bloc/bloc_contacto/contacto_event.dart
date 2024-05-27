import 'package:equatable/equatable.dart';

abstract class ContactoEvent extends Equatable {
  const ContactoEvent();

  @override
  List<Object?> get props => [];
}

class LoadContactoDataEvent extends ContactoEvent {}

class NameContactoChanged extends ContactoEvent {
  final String nameContacto;

  const NameContactoChanged(this.nameContacto);

  @override
  List<Object?> get props => [nameContacto];
}

class AliasContactoChanged extends ContactoEvent {
  final String aliasContacto;

  const AliasContactoChanged(this.aliasContacto);

  @override
  List<Object?> get props => [aliasContacto];
}

class NumtarjetChanged extends ContactoEvent {
  final String numTarjet;

  const NumtarjetChanged(this.numTarjet);

  @override
  List<Object?> get props => [numTarjet];
}

class FotoPerfilChanged extends ContactoEvent {
  final String fotoPerfil;

  const FotoPerfilChanged(this.fotoPerfil);

  @override
  List<Object?> get props => [fotoPerfil];
}

class ContactoSubmitted extends ContactoEvent {}
