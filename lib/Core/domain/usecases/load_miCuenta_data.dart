import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/micuenta_Repositorie.dart';

class LoadMiCuentaData {
  final MiCuentaRepository repository;

  LoadMiCuentaData(this.repository);

  Future<Micuenta> call() async {
    final miCuentaData = await repository.loadMiCuentaData();

    // Validaciones
    if (miCuentaData.numCuenta.isEmpty) {
      throw Exception("numCuenta cannot be empty");
    }
    if (miCuentaData.user.isEmpty) {
      throw Exception("user cannot be empty");
    }
    if (miCuentaData.cell.isEmpty) {
      throw Exception("cell cannot be empty");
    }
    if (miCuentaData.userEmail.isEmpty) {
      throw Exception("userEmail cannot be empty");
    }
    if (miCuentaData.fotoPerfil.isEmpty) {
      throw Exception("fotoPerfil cannot be empty");
    }

    return miCuentaData;
  }
}
