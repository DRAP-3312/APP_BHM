
import 'package:bhm_app/Core/domain/models/transferencia_model.dart';

abstract class TransferenciaRepository{
  Future<Transferencia> loadTransferenciaData();
}