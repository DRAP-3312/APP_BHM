import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:bhm_app/Core/domain/repositories/transferencia_Repositorie.dart';

class LoadTransferenciaData {
  final TransferenciaRepository repository;

  LoadTransferenciaData(this.repository);

  Future<Transferencia> call() async {
    final transferData = await repository.loadTransferenciaData();

    // Validaciones
    if (transferData.nameContacto.isEmpty) {
      throw Exception("nameContacto cannot be empty");
    }
    if (transferData.montoTrans < 0.0) {
      throw Exception("montoTrans cannot be empty");
    }
    if (transferData.fechaTrans.isEmpty) {
      throw Exception("fechaTrans cannot be empty");
    }
    // quiza opcional
    if (transferData.saldoDisponible < 0.0) {
      throw Exception("saldoDisponible cannot be empty");
    }

    return transferData;
  }
}
