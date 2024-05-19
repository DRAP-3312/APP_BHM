import 'dart:ffi';

class Servicio {
  Float montoPago;
  String referencia;
  DateTime fecha;

  Servicio(
      {required this.montoPago, required this.referencia, required this.fecha});
}
