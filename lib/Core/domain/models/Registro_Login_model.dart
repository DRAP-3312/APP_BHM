import 'package:json_annotation/json_annotation.dart';

part 'Registro_Login_model.g.dart';

@JsonSerializable()
class RegistroLogin{
  String name;
  String lastname;
  String email;
  String rfc;
  String phone;
  String password;
  // ignore: non_constant_identifier_names
  int id_banck;
  bool isValid;

  RegistroLogin(
      {
      required this.name,
      required this.lastname,
      required this.email,
      required this.rfc,
      required this.phone,
      required this.password,
      // ignore: non_constant_identifier_names
      required this.id_banck,
      required this.isValid});

  factory RegistroLogin.fromJson(Map<String, dynamic> json) => _$RegistroLoginFromJson(json);
  Map<String, dynamic> toJson() => _$RegistroLoginToJson(this);
}
