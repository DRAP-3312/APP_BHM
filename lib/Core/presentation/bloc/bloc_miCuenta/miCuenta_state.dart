import 'package:equatable/equatable.dart';
import 'package:bhm_app/Core/domain/models/micuenta_model.dart';

class MiCuentaState extends Equatable {
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  final int id_bank;
  final Map<String, dynamic> error;
  final bool isValid;

  const MiCuentaState({
    this.id = 0,
    this.name = '',
    this.lastname = '',
    this.email = '',
    this.rfc = '',
    this.phone = '',
    this.password = '',
    this.id_bank = 0,
    this.error = const {},
    this.isValid = false,
  });

  MiCuentaState copyWith({
    int? id,
    String? name,
    String? lastname,
    String? email,
    String? rfc,
    String? phone,
    String? password,
    int? id_bank,
    Map<String, dynamic>? error,
    bool? isValid,
  }) {
    return MiCuentaState(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      rfc: rfc ?? this.rfc,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      id_bank: id_bank ?? this.id_bank,
      error: error ?? this.error,
      isValid: isValid ?? this.isValid,
    );
  }

  factory MiCuentaState.fromModel(Micuenta model) {
    return MiCuentaState(
      id: model.id,
      name: model.name,
      lastname: model.lastname,
      email: model.email,
      rfc: model.rfc,
      phone: model.phone,
      password: model.password,
      id_bank: model.id_bank,
      isValid: model.isValid,
    );
  }

  @override
  List<Object?> get props => [id, name, lastname, email, rfc, phone, password, id_bank, error, isValid];
}
