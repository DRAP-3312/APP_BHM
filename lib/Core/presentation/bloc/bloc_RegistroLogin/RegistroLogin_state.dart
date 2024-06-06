import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';
import 'package:equatable/equatable.dart';

class RegistroLoginState extends Equatable {
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  // ignore: non_constant_identifier_names
  final int id_banck;
  final bool isValid;

  const RegistroLoginState({
    this.name = '',
    this.lastname = '',
    this.email = '',
    this.rfc = '',
    this.phone = '',
    this.password = '',
    this.id_banck = 1,
    this.isValid = false,
  });

  factory RegistroLoginState.fromModel(RegistroLogin model) {
    return RegistroLoginState(
      name: model.name,
      lastname: model.lastname,
      email: model.email,
      rfc: model.rfc,
      phone: model.phone,
      password: model.password,
      id_banck: model.id_banck,
      isValid: true,
    );
  }

  RegistroLoginState copyWith({
    String? name,
    String? lastname,
    String? email,
    String? rfc,
    String? phone,
    String? password,
    int? id_banck,
    bool? isValid,
  }) {
    return RegistroLoginState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      rfc: rfc ?? this.rfc,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      id_banck: id_banck ?? this.id_banck,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        name,
        lastname,
        email,
        rfc,
        phone,
        password,
        // ignore: non_constant_identifier_names
        id_banck,
        isValid,
      ];
}
