import 'package:json_annotation/json_annotation.dart';

part 'servicio_model.g.dart';

@JsonSerializable()
class Servicio {
  double montoPago;
  String referencia;
  DateTime fecha;

  Servicio(
      {required this.montoPago, required this.referencia, required this.fecha});

  factory Servicio.fromJson(Map<String, dynamic> json) => _$ServicioFromJson(json);
  Map<String, dynamic> toJson() => _$ServicioToJson(this);
}
