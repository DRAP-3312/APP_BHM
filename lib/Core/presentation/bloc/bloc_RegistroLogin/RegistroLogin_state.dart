import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';
import 'package:equatable/equatable.dart';

// class RegistroLoginState extends Equatable {
//   final String name;
//   final String lastname;
//   final String email;
//   final String rfc;
//   final String phone;
//   final String password;
//   // ignore: non_constant_identifier_names
//   final int id_banck;
//   final bool isValid;
//   final Map<String, String?> errors;

//   const RegistroLoginState({
//     this.name = '',
//     this.lastname = '',
//     this.email = '',
//     this.rfc = '',
//     this.phone = '',
//     this.password = '',
//     this.id_banck = 1,
//     this.isValid = false,
//     this.errors = const {},
//   });

//   factory RegistroLoginState.fromModel(RegistroLogin model) {
//     return RegistroLoginState(
//       name: model.name,
//       lastname: model.lastname,
//       email: model.email,
//       rfc: model.rfc,
//       phone: model.phone,
//       password: model.password,
//       id_banck: model.id_banck,
//       isValid: true
//     );
//   }

//   RegistroLoginState copyWith({
//     String? name,
//     String? lastname,
//     String? email,
//     String? rfc,
//     String? phone,
//     String? password,
//     int? id_banck,
//     bool? isValid,
//     Map<String, String?>? errors,
//   }) {
//     return RegistroLoginState(
//       name: name ?? this.name,
//       lastname: lastname ?? this.lastname,
//       email: email ?? this.email,
//       rfc: rfc ?? this.rfc,
//       phone: phone ?? this.phone,
//       password: password ?? this.password,
//       id_banck: id_banck ?? this.id_banck,
//       isValid: isValid ?? this.isValid,
//       errors: errors ?? this.errors,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         name,
//         lastname,
//         email,
//         rfc,
//         phone,
//         password,
//         // ignore: non_constant_identifier_names
//         id_banck,
//         isValid,
//         errors,
//       ];
// }


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
  final Map<String, String?> errors;

  const RegistroLoginState({
    this.name = '',
    this.lastname = '',
    this.email = '',
    this.rfc = '',
    this.phone = '',
    this.password = '',
    this.id_banck = 1,
    this.isValid = false,
    this.errors = const {},
  });

  factory RegistroLoginState.fromModel(RegistroLogin model) {
    final initialErrors = <String, String?>{};

    // Validaciones iniciales para cada campo
    if (model.name.isEmpty || !RegExp(r"^[a-zA-Z\s]+$").hasMatch(model.name)) {
      initialErrors['name'] = 'El nombre solo puede contener letras y espacios.';
    }
    if (model.lastname.isEmpty) {
      initialErrors['lastname'] = 'El apellido no puede estar vacío.';
    }
    if (model.email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(model.email)) {
      initialErrors['email'] = 'Ingrese un correo electrónico válido.';
    }
    if (model.rfc.isEmpty || !RegExp(r'^([A-ZÑ&]{3,4})?\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])[A-Z\d]{2}[A\d]$').hasMatch(model.rfc)) {
      initialErrors['rfc'] = 'Ingrese un RFC válido.';
    }
    if (model.phone.isEmpty || !RegExp(r'^\d{10}$').hasMatch(model.phone)) {
      initialErrors['phone'] = 'Ingrese un número de teléfono válido de 10 dígitos.';
    }
    if (model.password.isEmpty || model.password.length < 8) {
      initialErrors['password'] = 'La contraseña debe tener al menos 8 caracteres.';
    }
    if (model.id_banck <= 0) {
      initialErrors['id_banck'] = 'El ID de banco debe ser un número entero positivo.';
    }

    return RegistroLoginState(
      name: model.name,
      lastname: model.lastname,
      email: model.email,
      rfc: model.rfc,
      phone: model.phone,
      password: model.password,
      id_banck: model.id_banck,
      isValid: initialErrors.isEmpty,
      errors: initialErrors,
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
    Map<String, String?>? errors,
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
      errors: errors ?? this.errors,
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
        id_banck,
        isValid,
        errors,
      ];
}

