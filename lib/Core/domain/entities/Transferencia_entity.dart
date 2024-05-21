

class Transferencia {
  final String nameContacto;

  final double  montoTrans;
  final DateTime fechaTrans;
  final double  saldoDisponible;

  Transferencia(
      {required this.nameContacto,
      required this.montoTrans,
      required this.fechaTrans,
      required this.saldoDisponible});
}
