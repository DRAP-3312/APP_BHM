import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/micuenta_Repositorie.dart';

class LoadMiCuentaData {
  final MiCuentaRepository repository;

  LoadMiCuentaData(this.repository);

  Future<Micuenta> call() async {
    final miCuentaData = await repository.loadMiCuentaData();

    if (miCuentaData.id == 0) {
      throw Exception("id no puede ser nulo");
    }

    if (miCuentaData.name.isEmpty) {
      throw Exception("name no puede ser vacío");
    }

    if (miCuentaData.lastname.isEmpty) {
      throw Exception("lastname no puede ser vacío");
    }

    if (miCuentaData.email.isEmpty) {
      throw Exception("email no puede ser vacío");
    }
    if (!_isValidEmail(miCuentaData.email)) {
      throw Exception("email formato inválido");
    }

    if (miCuentaData.rfc.isEmpty) {
      throw Exception("rfc no puede ser vacío");
    }
    if (!_isValidRFC(miCuentaData.rfc)) {
      throw Exception("rfc formato inválido");
    }

    if (miCuentaData.phone.isEmpty) {
      throw Exception("phone no puede ser vacío");
    }
    if (!_isValidPhoneNumber(miCuentaData.phone)) {
      throw Exception("phone formato inválido");
    }

    if (miCuentaData.password.isEmpty) {
      throw Exception("password no puede ser vacío");
    }

    if (miCuentaData.id_bank == 0) {
      throw Exception("id_bank no puede ser nulo");
    }

    return miCuentaData;
  }

  bool _isValidEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  bool _isValidRFC(String rfc) {
    final rfcRegExp = RegExp(r'^[A-Z]{4}\d{6}[A-Z0-9]{3}$');
    return rfcRegExp.hasMatch(rfc);
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    final phoneNumberRegExp = RegExp(r'^\d{10}$');
    return phoneNumberRegExp.hasMatch(phoneNumber);
  }
}
