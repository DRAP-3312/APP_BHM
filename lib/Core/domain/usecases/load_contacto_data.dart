import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/cuenta_Repositorie.dart';

class LoadContactoData {
  final CuentaRepository repository;

  LoadContactoData(this.repository);

  Future<Cuenta> call() async {
    final cuentaData = await repository.loadCuentaData();

    // Validaciones
    if (cuentaData.nameContacto.isEmpty) {
      throw Exception("nameContacto cannot be empty");
    }
    if (cuentaData.aliasContacto.isEmpty) {
      throw Exception("aliasContacto cannot be empty");
    }
    if (cuentaData.numTarjet.isEmpty) {
      throw Exception("numTarjet cannot be empty");
    }
    if (cuentaData.fotoPerfil.isEmpty) {
      throw Exception("fotoPerfil cannot be empty");
    }

    return cuentaData;
  }
}
