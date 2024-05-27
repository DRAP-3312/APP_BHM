// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferencia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transferencia _$TransferenciaFromJson(Map<String, dynamic> json) =>
    Transferencia(
      nameContacto: json['nameContacto'] as String,
      montoTrans: (json['montoTrans'] as num).toDouble(),
      fechaTrans: json['fechaTrans'] as String,
      saldoDisponible: (json['saldoDisponible'] as num).toDouble(),
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$TransferenciaToJson(Transferencia instance) =>
    <String, dynamic>{
      'nameContacto': instance.nameContacto,
      'montoTrans': instance.montoTrans,
      'fechaTrans': instance.fechaTrans,
      'saldoDisponible': instance.saldoDisponible,
      'isValid': instance.isValid,
    };
