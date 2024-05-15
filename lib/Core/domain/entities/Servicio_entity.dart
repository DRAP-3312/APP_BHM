import 'dart:ffi';

class Servicio {
  final Float montoPago;
  final String referencia;
  final DateTime fecha;

  Servicio(
      {required this.montoPago, required this.referencia, required this.fecha});
}
