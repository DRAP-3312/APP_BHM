import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/micuenta_Repositorie.dart';

class LoadMiCuentaData {
  final MiCuentaRepository repository;

  LoadMiCuentaData(this.repository);

  Future<Micuenta> call() async {
    final miCuentaData = await repository.loadMiCuentaData();

    if (miCuentaData.numCuenta.isEmpty) {
      throw Exception("numCuenta no puede ser vacio");
    }
    if (!_isValidAccountNumber(miCuentaData.numCuenta)) {
      throw Exception("numCuenta formato invalido");
    }

    if (miCuentaData.user.isEmpty) {
      throw Exception("user no puede ser vacio");
    }
    if (!_isValidUser(miCuentaData.user)) {
      throw Exception("user formato invalido");
    }

    if (miCuentaData.cell.isEmpty) {
      throw Exception("cell no puede ser vacio");
    }
    if (!_isValidCellNumber(miCuentaData.cell)) {
      throw Exception("cell formato invalido");
    }

    if (miCuentaData.userEmail.isEmpty) {
      throw Exception("userEmail no puede ser vacio");
    }
    if (!_isValidEmail(miCuentaData.userEmail)) {
      throw Exception("email formato invalido");
    }

    if (miCuentaData.fotoPerfil.isEmpty) {
      throw Exception("fotoPerfil no puede ser vacio");
    }

    return miCuentaData;
  }

  bool _isValidAccountNumber(String accountNumber) {
    final accountNumberRegExp = RegExp(r'^4550\d{6}$');
    return accountNumberRegExp.hasMatch(accountNumber);
  }

  bool _isValidUser(String user) {
    final userRegExp = RegExp(r'^[a-zA-Z\s]+$');
    return userRegExp.hasMatch(user);
  }

  bool _isValidCellNumber(String cellNumber) {
    final cellNumberRegExp = RegExp(r'^\d{10}$');
    return cellNumberRegExp.hasMatch(cellNumber);
  }

  bool _isValidEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }
}
