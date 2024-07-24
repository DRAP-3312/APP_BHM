

class Transferencia {
  final String nameContacto;
  final int  amount;
  final String fechaTrans;
  final double  saldoDisponible;
  final bool isValid;
  final int id_sender;
  final int id_receptor;
  final String sender_account;
  final String recepto_account;


  Transferencia(
      {required this.nameContacto,
      required this.amount,
      required this.fechaTrans,
      required this.saldoDisponible,
      required this.id_receptor,
      required this.id_sender,
      required this.sender_account,
      required this.recepto_account,
      required this.isValid});
}
