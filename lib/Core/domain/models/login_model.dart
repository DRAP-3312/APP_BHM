import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class Login {
  String userEmail;
  String password;
  bool saveSesion;
  bool isValid;

  Login(
      {required this.userEmail,
      required this.password,
      required this.saveSesion,
      required this.isValid});

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
