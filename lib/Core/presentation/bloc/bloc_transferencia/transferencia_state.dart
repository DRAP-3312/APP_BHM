import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:equatable/equatable.dart';

class TranferenciaState extends Equatable {
  final String nameContacto;
  final double montoTrans;
  final String fechaTrans;
  final double saldoDisponible;
  final bool isValid;

  const TranferenciaState({
    this.nameContacto = '',
    this.montoTrans = 0.0,
    this.fechaTrans = '',
    this.saldoDisponible = 0.0,
    this.isValid = false,
  });

  factory TranferenciaState.fromModel(Transferencia model) {
    return TranferenciaState(
      nameContacto: model.nameContacto,
      montoTrans: model.montoTrans,
      fechaTrans: model.fechaTrans,
      saldoDisponible: model.saldoDisponible,
      isValid: true,
    );
  }

  TranferenciaState copyWith({
    String? nameContacto,
    double? montoTrans,
    String? fechaTrans,
    double? saldoDisponible,
    bool? isValid,
  }) {
    return TranferenciaState(
      nameContacto: nameContacto ?? this.nameContacto,
      montoTrans: montoTrans ?? this.montoTrans,
      fechaTrans: fechaTrans ?? this.fechaTrans,
      saldoDisponible: saldoDisponible ?? this.saldoDisponible,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        nameContacto,
        montoTrans,
        fechaTrans,
        saldoDisponible,
        isValid,
      ];
}
