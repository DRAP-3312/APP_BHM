import 'package:json_annotation/json_annotation.dart';

part 'inicio_model.g.dart';

@JsonSerializable()
class Inicio {
  String userName;
  String numTarjet;
  int cvc;
  String news;
  String fotoUser;
  String fotoNews;

  Inicio(
      {required this.userName,
      required this.numTarjet,
      required this.cvc,
      required this.news,
      required this.fotoUser,
      required this.fotoNews});

  factory Inicio.fromJson(Map<String, dynamic> json) =>  _$InicioFromJson(json);
  Map<String, dynamic> toJson() => _$InicioToJson(this);
}
