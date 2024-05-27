// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'micuenta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Micuenta _$MicuentaFromJson(Map<String, dynamic> json) => Micuenta(
      numCuenta: json['numCuenta'] as String,
      user: json['user'] as String,
      cell: json['cell'] as String,
      userEmail: json['userEmail'] as String,
      fotoPerfil: json['fotoPerfil'] as String,
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$MicuentaToJson(Micuenta instance) => <String, dynamic>{
      'numCuenta': instance.numCuenta,
      'user': instance.user,
      'cell': instance.cell,
      'userEmail': instance.userEmail,
      'fotoPerfil': instance.fotoPerfil,
      'isValid': instance.isValid,
    };
