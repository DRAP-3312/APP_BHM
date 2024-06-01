import 'package:bhm_app/Core/domain/models/login_model.dart';
import 'package:bhm_app/Core/domain/repositories/login_Repositorie.dart';

class LoadLoginData {
  final LoginRepository repository;

  LoadLoginData(this.repository);

  Future<Login> call() async {
    final loginData = await repository.loadLoginData();

    // Validaciones
    if (loginData.userEmail.isEmpty) {
      throw Exception("userEmail cannot be empty");
    }
    if (loginData.password.isEmpty) {
      throw Exception("password cannot be empty");
    }
    //no se si sea opcional esto :/
    if (!loginData.saveSesion) {
      throw Exception("No se gurdara la sesion");
    }

    return loginData;
  }
}
