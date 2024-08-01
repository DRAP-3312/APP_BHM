// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferencia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transferencia _$TransferenciaFromJson(Map<String, dynamic> json) =>
    Transferencia(
      user_account: json['user_account'] as String,
      receptor_account: json['receptor_account'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$TransferenciaToJson(Transferencia instance) =>
    <String, dynamic>{
      'user_account': instance.user_account,
      'receptor_account': instance.receptor_account,
      'amount': instance.amount,
    };
