// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'transferencia_model.g.dart';

@JsonSerializable()
class Transferencia {
  String user_account;
  String receptor_account;
  int amount;

  Transferencia(
      {required this.user_account,
      required this.receptor_account,
      required this.amount});

  factory Transferencia.fromJson(Map<String, dynamic> json) =>
      _$TransferenciaFromJson(json);
  Map<String, dynamic> toJson() => _$TransferenciaToJson(this);
}
