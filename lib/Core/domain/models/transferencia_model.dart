import 'dart:ffi';

class Transferencia {
  String nameContacto;
  Float montoTrans;
  DateTime fechaTrans;
  Float saldoDisponible;

  Transferencia(
      {required this.nameContacto,
      required this.montoTrans,
      required this.fechaTrans,
      required this.saldoDisponible});
}
