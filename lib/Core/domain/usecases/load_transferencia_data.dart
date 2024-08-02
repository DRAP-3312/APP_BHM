import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:bhm_app/Core/domain/repositories/transferencia_Repositorie.dart';


class LoadTransferenciaData {
  final TransferenciaRepository repository;

  LoadTransferenciaData(this.repository);

  Future<Transferencia> call() async {
    final transferData = await repository.loadTransferenciaData();

    if (transferData.user_account.isEmpty) {
      throw Exception("user_account no puede ser vacio");
    }
    if (transferData.receptor_account.isEmpty) {
      throw Exception("receptor_account no puede ser vacio");
    }

    if (transferData.amount <= 0.0) {
      throw Exception("amount debe ser positivo");
    }

    bool validarVacio(String valor){
      if(valor.isEmpty){
        return false;
      }
      return true;
    }
    return transferData;
  }
}
