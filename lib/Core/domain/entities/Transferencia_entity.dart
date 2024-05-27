

class Transferencia {
  final String nameContacto;
  final double  montoTrans;
  final String fechaTrans;
  final double  saldoDisponible;
  final bool isValid;

  Transferencia(
      {required this.nameContacto,
      required this.montoTrans,
      required this.fechaTrans,
      required this.saldoDisponible,
      required this.isValid});
}
