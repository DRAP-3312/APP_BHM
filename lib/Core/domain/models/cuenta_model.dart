// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'cuenta_model.g.dart';

@JsonSerializable()
class Cuenta {
  int id;
  int id_user;
  String nickname;
  String account;
  String email;
  String phone;
  String bankname;

  Cuenta({
    required this.id,
    required this.id_user,
    required this.nickname,
    required this.account,
    required this.email,
    required this.phone,
    required this.bankname
  });

  factory Cuenta.fromJson(Map<String, dynamic> json) => _$CuentaFromJson(json);
  Map<String, dynamic> toJson() => _$CuentaToJson(this);
}
