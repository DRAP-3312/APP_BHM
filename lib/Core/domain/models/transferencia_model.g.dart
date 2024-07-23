// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferencia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transferencia _$TransferenciaFromJson(Map<String, dynamic> json) =>
    Transferencia(
      nameContacto: json['nameContacto'] as String,
      amount: json['montoTrans'] as int,
      fechaTrans: json['fechaTrans'] as String,
      id_receptor: json["id_receptor"] as int,
      id_sender: json["id_sender"]as int,
      sender_account: json["sender_account"]as String,
      recepto_account: json["receptor_account"]as String,
      saldoDisponible: (json['saldoDisponible'] as num).toDouble(),
      isValid: json['isValid'] as bool,

    );

Map<String, dynamic> _$TransferenciaToJson(Transferencia instance) =>
    <String, dynamic>{
      'nameContacto': instance.nameContacto,
      'amount': instance.amount,
      'fechaTrans': instance.fechaTrans,
      'saldoDisponible': instance.saldoDisponible,
      'isValid': instance.isValid,
    };
