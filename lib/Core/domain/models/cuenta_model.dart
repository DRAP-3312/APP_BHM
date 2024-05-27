import 'package:json_annotation/json_annotation.dart';

part 'cuenta_model.g.dart';

@JsonSerializable()
class Cuenta {
  String nameContacto;
  String aliasContacto;
  String numTarjet;
  String fotoPerfil;
   bool isValid;

  Cuenta(
      {required this.nameContacto,
      required this.aliasContacto,
      required this.numTarjet,
      required this.fotoPerfil,
      required this.isValid});

  factory Cuenta.fromJson(Map<String,dynamic> json) => _$CuentaFromJson(json);
  Map<String,dynamic> toJson( ) => _$CuentaToJson(this);
}

