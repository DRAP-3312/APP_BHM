import 'package:json_annotation/json_annotation.dart';

part 'notificacion_model.g.dart';

@JsonSerializable()
class Notificacion {
  String nameRetiro;
  DateTime timeRetiro;

  Notificacion({required this.nameRetiro, required this.timeRetiro});

  factory Notificacion.fromJson(Map<String,dynamic> json) => _$NotificacionFromJson(json);
  Map<String,dynamic> toJson( ) => _$NotificacionToJson(this);
}
