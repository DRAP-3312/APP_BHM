import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:equatable/equatable.dart';

class TranferenciaState extends Equatable {
  final String nameContacto;
  final int amount;
  final String fechaTrans;
  final double saldoDisponible;
  final bool isValid;

  const TranferenciaState({
    this.nameContacto = '',
    this.amount = 0,
    this.fechaTrans = '',
    this.saldoDisponible = 0.0,
    this.isValid = false,
  });

  factory TranferenciaState.fromModel(Transferencia model) {
    return TranferenciaState(
      nameContacto: model.nameContacto,
      amount: model.amount,
      fechaTrans: model.fechaTrans,
      saldoDisponible: model.saldoDisponible,
      isValid: true,
    );
  }

  TranferenciaState copyWith({
    String? nameContacto,
    int? amount,
    String? fechaTrans,
    double? saldoDisponible,
    bool? isValid,
  }) {
    return TranferenciaState(
      nameContacto: nameContacto ?? this.nameContacto,
      amount: amount ?? this.amount,
      fechaTrans: fechaTrans ?? this.fechaTrans,
      saldoDisponible: saldoDisponible ?? this.saldoDisponible,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        nameContacto,
        amount,
        fechaTrans,
        saldoDisponible,
        isValid,
      ];
}
