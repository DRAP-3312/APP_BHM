
import 'package:bhm_app/Core/domain/models/servicio_model.dart';

abstract class ServicioRepository{
  Future<Servicio> LoadServicioData();
}