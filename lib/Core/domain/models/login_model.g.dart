// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      userEmail: json['userEmail'] as String,
      password: json['password'] as String,
      saveSesion: json['saveSesion'] as bool,
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'userEmail': instance.userEmail,
      'password': instance.password,
      'saveSesion': instance.saveSesion,
      'isValid': instance.isValid,
    };
