
import 'package:bhm_app/Core/domain/models/cuenta_model.dart';

abstract class CuentaRepository{
  Future<List<Cuenta>> loadCuentaData();
}