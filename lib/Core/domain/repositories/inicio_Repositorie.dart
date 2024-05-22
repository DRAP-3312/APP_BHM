
import 'package:bhm_app/Core/domain/models/inicio_model.dart';

abstract class InicioRepository{
  Future<Inicio> LoadInicioData();
}