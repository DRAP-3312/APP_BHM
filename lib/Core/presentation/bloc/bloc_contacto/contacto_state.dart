import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:equatable/equatable.dart';

class ContactoState extends Equatable {
  final String nameContacto;
  final String aliasContacto;
  final String numTarjet;
  final String fotoPerfil;
  final bool isValid;

  const ContactoState({
    this.nameContacto = '',
    this.aliasContacto = '',
    this.numTarjet = '',
    this.fotoPerfil = '',
    this.isValid = false,
  });

  factory ContactoState.fromModel(Cuenta model) {
    return ContactoState(
      nameContacto: model.nameContacto,
      aliasContacto: model.aliasContacto,
      numTarjet: model.numTarjet,
      fotoPerfil: model.fotoPerfil,
      isValid: true,
    );
  }

  ContactoState copyWith({
    String? nameContacto,
    String? aliasContacto,
    String? numTarjet,
    String? fotoPerfil,
    bool? isValid,
  }) {
    return ContactoState(
      nameContacto: nameContacto ?? this.nameContacto,
      aliasContacto: aliasContacto ?? this.aliasContacto,
      numTarjet: numTarjet ?? this.numTarjet,
      fotoPerfil: fotoPerfil ?? this.fotoPerfil,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        nameContacto,
        aliasContacto,
        numTarjet,
        fotoPerfil,
        isValid,
      ];
}
