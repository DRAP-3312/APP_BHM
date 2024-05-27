// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Servicio _$ServicioFromJson(Map<String, dynamic> json) => Servicio(
      montoPago: (json['montoPago'] as num).toDouble(),
      referencia: json['referencia'] as String,
      fecha: json['fecha'] as String,
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$ServicioToJson(Servicio instance) => <String, dynamic>{
      'montoPago': instance.montoPago,
      'referencia': instance.referencia,
      'fecha': instance.fecha,
      'isValid': instance.isValid,
    };
