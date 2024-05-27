import 'package:json_annotation/json_annotation.dart';

part 'notificacion_model.g.dart';

@JsonSerializable()
class Notificacion {
  String nameRetiro;
  String timeRetiro;
  bool isValid;

  Notificacion({required this.nameRetiro, required this.timeRetiro, required this.isValid});

  factory Notificacion.fromJson(Map<String,dynamic> json) => _$NotificacionFromJson(json);
  Map<String,dynamic> toJson( ) => _$NotificacionToJson(this);
}
