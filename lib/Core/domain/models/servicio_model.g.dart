// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Servicio _$ServicioFromJson(Map<String, dynamic> json) => Servicio(
      montoPago: (json['montoPago'] as num).toDouble(),
      referencia: json['referencia'] as String,
      fecha: DateTime.parse(json['fecha'] as String),
    );

Map<String, dynamic> _$ServicioToJson(Servicio instance) => <String, dynamic>{
      'montoPago': instance.montoPago,
      'referencia': instance.referencia,
      'fecha': instance.fecha.toIso8601String(),
    };
