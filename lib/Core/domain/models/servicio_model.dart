import 'package:json_annotation/json_annotation.dart';

part 'servicio_model.g.dart';

@JsonSerializable()
class Servicio {
  double montoPago;
  String referencia;
  String fecha;
  bool isValid;

  Servicio(
      {required this.montoPago, required this.referencia, required this.fecha, required this.isValid});

  factory Servicio.fromJson(Map<String, dynamic> json) => _$ServicioFromJson(json);
  Map<String, dynamic> toJson() => _$ServicioToJson(this);
}
