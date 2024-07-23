
import 'package:json_annotation/json_annotation.dart';
part 'transferencia_model.g.dart';

@JsonSerializable()
class Transferencia {
  String nameContacto;
  int amount;
  int id_sender;
  int id_receptor;
  String fechaTrans;
  double saldoDisponible;
  bool isValid;
  String sender_account;
  String recepto_account;


  Transferencia(
      {required this.nameContacto,
      required this.amount,
      required this.fechaTrans,
      required this.saldoDisponible,
      required this.id_sender,
      required this.id_receptor,
      required this.recepto_account,
      required this.sender_account,
      required this.isValid});

  factory Transferencia.fromJson(Map<String, dynamic> json) =>
      _$TransferenciaFromJson(json);
  Map<String, dynamic> toJson() => _$TransferenciaToJson(this);
}
