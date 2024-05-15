import 'dart:ffi';

class Transferencia {
  final String nameContacto;

  final Float montoTrans;
  final DateTime fechaTrans;
  final Float saldoDisponible;

  Transferencia(
      {required this.nameContacto,
      required this.montoTrans,
      required this.fechaTrans,
      required this.saldoDisponible});
}
