// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuenta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cuenta _$CuentaFromJson(Map<String, dynamic> json) => Cuenta(
      id_user: (json['id_user'] as num).toInt(),
      nickname: json['nickname'] as String,
      account: json['account'] as String,
    );

Map<String, dynamic> _$CuentaToJson(Cuenta instance) => <String, dynamic>{
      'id_user': instance.id_user,
      'nickname': instance.nickname,
      'account': instance.account,
    };
