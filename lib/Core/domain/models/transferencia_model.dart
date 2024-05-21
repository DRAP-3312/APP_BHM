import 'package:json_annotation/json_annotation.dart';

part 'transferencia_model.g.dart';

@JsonSerializable()
class Transferencia {
  String nameContacto;
  double montoTrans;
  DateTime fechaTrans;
  double saldoDisponible;

  Transferencia(
      {required this.nameContacto,
      required this.montoTrans,
      required this.fechaTrans,
      required this.saldoDisponible});

  factory Transferencia.fromJson(Map<String, dynamic> json) =>
      _$TransferenciaFromJson(json);
  Map<String, dynamic> toJson() => _$TransferenciaToJson(this);
}
