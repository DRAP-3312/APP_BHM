// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notificacion _$NotificacionFromJson(Map<String, dynamic> json) => Notificacion(
      nameRetiro: json['nameRetiro'] as String,
      timeRetiro: DateTime.parse(json['timeRetiro'] as String),
    );

Map<String, dynamic> _$NotificacionToJson(Notificacion instance) =>
    <String, dynamic>{
      'nameRetiro': instance.nameRetiro,
      'timeRetiro': instance.timeRetiro.toIso8601String(),
    };
