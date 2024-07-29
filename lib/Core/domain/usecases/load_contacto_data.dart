import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/cuenta_Repositorie.dart';


class LoadContactoData {
  final CuentaRepository repository;

  LoadContactoData(this.repository);

  Future<List<Cuenta>> call() async {
    final List<Cuenta> cuentaData = await repository.loadCuentaData();

    for(var contacto in cuentaData){
      if(contacto.id_user < 0) throw Exception("Id user invalida");
      if(contacto.nickname.isEmpty) throw Exception("nickname no puedo ser vacio");
      if(contacto.account.isEmpty) throw Exception("account no puede ser vacio");
    }

    return cuentaData;
  }
}
