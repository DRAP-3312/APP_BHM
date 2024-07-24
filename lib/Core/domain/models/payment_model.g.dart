// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id_service: (json['id_service'] as num).toInt(),
      id_users: (json['id_users'] as num).toInt(),
      id_account: (json['id_account'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      reference: json['reference'] as String,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id_service': instance.id_service,
      'id_users': instance.id_users,
      'id_account': instance.id_account,
      'amount': instance.amount,
      'reference': instance.reference,
    };
