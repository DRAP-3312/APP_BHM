import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/cuenta_Repositorie.dart';

class LoadContactoData {
  final CuentaRepository repository;

  LoadContactoData(this.repository);

  Future<Cuenta> call() async {
    final cuentaData = await repository.loadCuentaData();

    if (cuentaData.nameContacto.isEmpty) {
      throw Exception("nameContacto no puede ser vacio");
    }
    if (!_isValidName(cuentaData.nameContacto)) {
      throw Exception("nameContacto fromato incorrecto");
    }

    if (cuentaData.aliasContacto.isEmpty) {
      throw Exception("aliasContacto no puede ser vacio");
    }

    if (cuentaData.numTarjet.isEmpty) {
      throw Exception("numTarjet no puede ser vacio");
    }
    if (!_isValidCardNumber(cuentaData.numTarjet)) {
      throw Exception("numTarjet formato invalido");
    }

    if (cuentaData.fotoPerfil.isEmpty) {
      throw Exception("fotoPerfil no puede ser vacio");
    }

    return cuentaData;
  }

  bool _isValidName(String name) {
    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    return nameRegExp.hasMatch(name);
  }

  bool _isValidCardNumber(String cardNumber) {
    final cardNumberRegExp = RegExp(r'^\d{16}$');
    return cardNumberRegExp.hasMatch(cardNumber);
  }
}
