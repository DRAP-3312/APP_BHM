import 'package:equatable/equatable.dart';

abstract class ServicioEvent extends Equatable {
  const ServicioEvent();

  @override
  List<Object?> get props => [];
}

class LoadServicioDataEvent extends ServicioEvent {}

class MontoPagoChanged extends ServicioEvent {
  final double montoPago;

  const MontoPagoChanged(this.montoPago);

  @override
  List<Object?> get props => [montoPago];
}

class ReferenciaChanged extends ServicioEvent {
  final String referencia;

  const ReferenciaChanged(this.referencia);

  @override
  List<Object?> get props => [referencia];
}

class FechaChanged extends ServicioEvent {
  final String fecha;

  const FechaChanged(this.fecha);

  @override
  List<Object?> get props => [fecha];
}


class ServicioSubmitted extends ServicioEvent {}
