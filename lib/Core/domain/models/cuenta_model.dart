// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'cuenta_model.g.dart';

@JsonSerializable()
class Cuenta {
  int id_user;
  String nickname;
  String account;

  Cuenta({
    required this.id_user,
    required this.nickname,
    required this.account,
  });

  factory Cuenta.fromJson(Map<String, dynamic> json) => _$CuentaFromJson(json);
  Map<String, dynamic> toJson() => _$CuentaToJson(this);
}
