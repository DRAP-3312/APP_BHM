// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notificacion _$NotificacionFromJson(Map<String, dynamic> json) => Notificacion(
      nameRetiro: json['nameRetiro'] as String,
      timeRetiro: json['timeRetiro'] as String,
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$NotificacionToJson(Notificacion instance) =>
    <String, dynamic>{
      'nameRetiro': instance.nameRetiro,
      'timeRetiro': instance.timeRetiro,
      'isValid': instance.isValid,
    };
