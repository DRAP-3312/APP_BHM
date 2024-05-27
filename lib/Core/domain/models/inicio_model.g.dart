// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inicio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inicio _$InicioFromJson(Map<String, dynamic> json) => Inicio(
      userName: json['userName'] as String,
      numTarjet: json['numTarjet'] as String,
      cvc: (json['cvc'] as num).toInt(),
      news: json['news'] as String,
      fotoUser: json['fotoUser'] as String,
      fotoNews: json['fotoNews'] as String,
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$InicioToJson(Inicio instance) => <String, dynamic>{
      'userName': instance.userName,
      'numTarjet': instance.numTarjet,
      'cvc': instance.cvc,
      'news': instance.news,
      'fotoUser': instance.fotoUser,
      'fotoNews': instance.fotoNews,
      'isValid': instance.isValid,
    };
