import 'package:json_annotation/json_annotation.dart';

part 'transferencia_model.g.dart';

@JsonSerializable()
class Transferencia {
  String nameContacto;
  double montoTrans;
  String fechaTrans;
  double saldoDisponible;
  bool isValid;

  Transferencia(
      {required this.nameContacto,
      required this.montoTrans,
      required this.fechaTrans,
      required this.saldoDisponible,
      required this.isValid});

  factory Transferencia.fromJson(Map<String, dynamic> json) =>
      _$TransferenciaFromJson(json);
  Map<String, dynamic> toJson() => _$TransferenciaToJson(this);
}
