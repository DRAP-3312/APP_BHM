import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:bhm_app/Core/domain/repositories/transferencia_Repositorie.dart';
import 'package:bhm_app/service/validDate.dart';

class LoadTransferenciaData {
  final TransferenciaRepository repository;

  LoadTransferenciaData(this.repository);

  Future<Transferencia> call() async {
    final transferData = await repository.loadTransferenciaData();

    if (transferData.nameContacto.isEmpty) {
      throw Exception("nameContacto no puede ser vacio");
    }

    if (transferData.montoTrans <= 0.0) {
      throw Exception("montoTrans debe ser positivo");
    }
    if (transferData.montoTrans > transferData.saldoDisponible) {
      throw Exception("montoTrans excede el saldo disponible");
    }

    if (transferData.fechaTrans.isEmpty) {
      throw Exception("fechaTrans no puede ser vacio");
    }
    if (!isValidDateFormat(transferData.fechaTrans)) {
      throw Exception("fechaTrans formato invalido. Debe ser dd/mm/yyyy");
    }

    if (transferData.saldoDisponible < 0.0) {
      throw Exception("saldoDisponible no puede ser negativo");
    }

    return transferData;
  }
}
