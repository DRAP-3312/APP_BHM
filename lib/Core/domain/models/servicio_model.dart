import 'package:json_annotation/json_annotation.dart';

part 'servicio_model.g.dart';

@JsonSerializable()
class Servicio {
  int id;
  String name;
  bool status;

  Servicio({
    required this.id,
    required this.name,
    required this.status,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) => _$ServicioFromJson(json);
  Map<String, dynamic> toJson() => _$ServicioToJson(this);
}
