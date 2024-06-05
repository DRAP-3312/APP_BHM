import 'package:bhm_app/Core/domain/models/inicio_model.dart';
import 'package:bhm_app/Core/domain/repositories/inicio_Repositorie.dart';

class LoadInicioData {
  final InicioRepository repository;

  LoadInicioData(this.repository);

  Future<Inicio> call() async {
    final inicioData = await repository.loadInicioData();

    if (inicioData.userName.isEmpty) {
      throw Exception("userName no puede ser vacio");
    }
    if (!_isValidUserName(inicioData.userName)) {
      throw Exception("userName formato invalido");
    }

    if (inicioData.numTarjet.isEmpty) {
      throw Exception("numTarjet no puede ser vacio");
    }
    if (!_isValidCardNumber(inicioData.numTarjet)) {
      throw Exception("numTarjet formato invalido");
    }

    if (inicioData.cvc == 0) {
      throw Exception("cvc no puede ser 0");
    }
    if (!_isValidCVC(inicioData.cvc)) {
      throw Exception("cvc formato invalido");
    }

    if (inicioData.news.isEmpty) {
      throw Exception("news no puede ser vacio");
    }
    if (!_isValidText(inicioData.news)) {
      throw Exception("news formato invalido");
    }

    if (inicioData.fotoUser.isEmpty) {
      throw Exception("fotoUser no puede ser vacio");
    }
    if (!_isValidText(inicioData.fotoUser)) {
      throw Exception("fotoUser formato invalido");
    }

    if (inicioData.fotoNews.isEmpty) {
      throw Exception("fotoNews no puede ser vacio");
    }
    if (!_isValidText(inicioData.fotoNews)) {
      throw Exception("fotoNews formato invalido");
    }

    return inicioData;
  }

  bool _isValidUserName(String userName) {
    final userNameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    return userNameRegExp.hasMatch(userName);
  }

  bool _isValidCardNumber(String cardNumber) {
    final cardNumberRegExp = RegExp(r'^\d{16}$');
    return cardNumberRegExp.hasMatch(cardNumber);
  }

  bool _isValidCVC(int cvc) {
    final cvcStr = cvc.toString();
    final cvcRegExp = RegExp(r'^\d{3,4}$');
    return cvcRegExp.hasMatch(cvcStr);
  }

  bool _isValidText(String text) {
    return text.isNotEmpty && text.trim().isNotEmpty;
  }
}
