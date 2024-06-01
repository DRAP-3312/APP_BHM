
import 'package:bhm_app/Core/domain/models/micuenta_model.dart';

abstract class MiCuentaRepository{
  Future<Micuenta> loadMiCuentaData();
}