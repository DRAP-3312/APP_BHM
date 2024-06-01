import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:bhm_app/Core/domain/repositories/servicio_Repositorie.dart';

class LoadServicioData {
  final ServicioRepository repository;

  LoadServicioData(this.repository);

  Future<Servicio> call() async {
    final servicioData = await repository.loadServicioData();

    // Validaciones
    if (servicioData.montoPago < 0.0) {
      throw Exception("montoPago cannot be empty");
    }
    if (servicioData.referencia.isEmpty) {
      throw Exception("referencia cannot be empty");
    }
    if (servicioData.fecha.isEmpty) {
      throw Exception("fecha cannot be empty");
    }

    return servicioData;
  }
}
