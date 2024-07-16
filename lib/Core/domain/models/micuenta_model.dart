import 'package:json_annotation/json_annotation.dart';

part 'micuenta_model.g.dart';

@JsonSerializable()
class Micuenta {
  int id;
  String name;
  String lastname;
  String email;
  String rfc;
  String phone;
  String password;
  int id_bank;
  //bool isValid;

  Micuenta({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.rfc,
    required this.phone,
    required this.password,
    required this.id_bank,
    //required this.isValid,
  });

  factory Micuenta.fromJson(Map<String, dynamic> json) {
    return Micuenta(
      id: json['id'] as int,
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      rfc: json['rfc'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      id_bank: json['id_bank'] as int,
      //isValid: json['isValid'] as bool? ?? false, // Aquí aseguramos que isValid tenga un valor por defecto
    );
  }

  Map<String, dynamic> toJson() => _$MicuentaToJson(this);
}