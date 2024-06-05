import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:bhm_app/Core/domain/repositories/servicio_Repositorie.dart';
import 'package:bhm_app/service/validDate.dart';

class LoadServicioData {
  final ServicioRepository repository;
  final double saldoDisponible;

  LoadServicioData(this.repository, this.saldoDisponible);

  Future<Servicio> call() async {
    final servicioData = await repository.loadServicioData();

    if (servicioData.montoPago < 0.0) {
      throw Exception("montoPago debe ser positivo");
    }
    if (servicioData.montoPago > saldoDisponible) {
      throw Exception("montoPago excede el saldo disponible");
    }

    if (servicioData.referencia.isEmpty) {
      throw Exception("referencia no puede ser vacio");
    }

    if (servicioData.fecha.isEmpty) {
      throw Exception("fecha no puede ser vacio");
    }
    if (!isValidDateFormat(servicioData.fecha)) {
      throw Exception("fecha formato invalido. Debe ser dd/mm/yyyy");
    }

    return servicioData;
  }
}
