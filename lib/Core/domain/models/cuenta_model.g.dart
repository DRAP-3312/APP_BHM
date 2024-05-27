// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuenta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cuenta _$CuentaFromJson(Map<String, dynamic> json) => Cuenta(
      nameContacto: json['nameContacto'] as String,
      aliasContacto: json['aliasContacto'] as String,
      numTarjet: json['numTarjet'] as String,
      fotoPerfil: json['fotoPerfil'] as String,
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$CuentaToJson(Cuenta instance) => <String, dynamic>{
      'nameContacto': instance.nameContacto,
      'aliasContacto': instance.aliasContacto,
      'numTarjet': instance.numTarjet,
      'fotoPerfil': instance.fotoPerfil,
      'isValid': instance.isValid,
    };
