import 'package:bhm_app/Core/domain/models/inicio_model.dart';
import 'package:bhm_app/Core/domain/repositories/inicio_Repositorie.dart';

class LoadInicioData {
  final InicioRepository repository;

  LoadInicioData(this.repository);

  Future<Inicio> call() async {
    final inicioData = await repository.loadInicioData();

    // Validaciones
    if (inicioData.userName.isEmpty) {
      throw Exception("userName cannot be empty");
    }
    if (inicioData.numTarjet.isEmpty) {
      throw Exception("numTarjet cannot be empty");
    }
    if (inicioData.cvc == 0) {
      throw Exception("cvc cannot be empty");
    }
    if (inicioData.news.isEmpty) {
      throw Exception("news cannot be empty");
    }
    if (inicioData.fotoUser.isEmpty) {
      throw Exception("fotoUser cannot be empty");
    }
    if (inicioData.fotoNews.isEmpty) {
      throw Exception("fotoNews cannot be empty");
    }

    return inicioData;
  }
}
