// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Servicio _$ServicioFromJson(Map<String, dynamic> json) => Servicio(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as bool,
      icono: json['icono'] as String?,
    );

Map<String, dynamic> _$ServicioToJson(Servicio instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'icono': instance.icono,
    };
