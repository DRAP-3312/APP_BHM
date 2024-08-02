import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:bhm_app/Core/domain/models/transferencia_model.dart';

class Movimientos {
  final List<Servicio> servicios;
  final List<Transferencia> transferencias;

  Movimientos({required this.servicios, required this.transferencias});
}