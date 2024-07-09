// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Registro_Login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistroLogin _$RegistroLoginFromJson(Map<String, dynamic> json) =>
    RegistroLogin(
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      rfc: json['rfc'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      id_banck: (json['id_banck'] as num).toInt(),
    );

Map<String, dynamic> _$RegistroLoginToJson(RegistroLogin instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'rfc': instance.rfc,
      'phone': instance.phone,
      'password': instance.password,
      'id_banck': instance.id_banck,
    };
