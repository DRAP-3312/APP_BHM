import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:equatable/equatable.dart';

class ServicioState extends Equatable {
  final double montoPago;
  final String referencia;
  final String fecha;
  final bool isValid;

  const ServicioState({
    this.montoPago = 0.0,
    this.referencia = '',
    this.fecha = '',
    this.isValid = false,
  });

  factory ServicioState.fromModel(Servicio model) {
    return ServicioState(
      montoPago: model.montoPago,
      referencia: model.referencia,
      fecha: model.fecha,
      isValid: true,
    );
  }

  ServicioState copyWith({
    double? montoPago,
    String? referencia,
    String? fecha,
    bool? isValid,
  }) {
    return ServicioState(
      montoPago: montoPago ?? this.montoPago,
      referencia: referencia ?? this.referencia,
      fecha: fecha ?? this.fecha,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        montoPago,
        referencia,
        fecha,
        isValid,
      ];
}
