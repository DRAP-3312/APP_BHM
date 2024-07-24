import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:bhm_app/Core/domain/repositories/servicio_Repositorie.dart';


class LoadServicioData {
  final ServicioRepository repository;

  LoadServicioData(this.repository);

  Future<List<Servicio>> call() async {
    final List<Servicio> serviciosData = await repository.loadServicioData();

    for (var servicioData in serviciosData) {
      if (servicioData.name.isEmpty) {
        throw Exception("El nombre del servicio no puede estar vacío");
      }

      if (!servicioData.status) {
        throw Exception("El servicio ${servicioData.name} no está activo");
      }
    }

    return serviciosData;
  }
}
