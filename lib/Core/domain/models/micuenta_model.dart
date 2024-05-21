import 'package:json_annotation/json_annotation.dart';

part 'micuenta_model.g.dart';

@JsonSerializable()
class Micuenta {
  String numCuenta;
  String user;
  String cell;
  String userEmail;
  String fotoPerfil;

  Micuenta(
      {required this.numCuenta,
      required this.user,
      required this.cell,
      required this.userEmail,
      required this.fotoPerfil});

  factory Micuenta.fromJson(Map<String, dynamic> json) => _$MicuentaFromJson(json);
  Map<String, dynamic> toJson() => _$MicuentaToJson(this);
}
