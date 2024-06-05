import 'package:bhm_app/Core/domain/models/login_model.dart';
import 'package:bhm_app/Core/domain/repositories/login_Repositorie.dart';

class LoadLoginData {
  final LoginRepository repository;

  LoadLoginData(this.repository);

  Future<Login> call() async {
    final loginData = await repository.loadLoginData();

    if (loginData.userEmail.isEmpty) {
      throw Exception("userEmail no puede estar vacio");
    }
    if (!_isValidEmail(loginData.userEmail)) {
      throw Exception("formato email incorrecto");
    }

    if (loginData.password.isEmpty) {
      throw Exception("password no puede estar vacio");
    }
    if (!_isValidPassword(loginData.password)) {
      throw Exception("password formato invalido");
    }

    if (!loginData.saveSesion) {
      throw Exception("No se guardará la sesión");
    }

    return loginData;
  }

  bool _isValidEmail(String email) {
    final emailRegExp =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    final invalidCharsRegExp = RegExp(r"[ #$%&'()*+,/;<=>?[\]^`{|}~]");
    return emailRegExp.hasMatch(email) &&
        !invalidCharsRegExp.hasMatch(email) &&
        !email.contains(' ');
  }

  bool _isValidPassword(String password) {
    if (password.length < 8) return false;
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) return false;
    if (!RegExp(r'[A-Z]').hasMatch(password)) return false;
    if (!RegExp(r'[a-z]').hasMatch(password)) return false;
    if (!RegExp(r'[0-9]').hasMatch(password)) return false;
    if (password.contains(' ')) return false;

    return true;
  }
}
