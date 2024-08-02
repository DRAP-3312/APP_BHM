abstract class MovimientosState {}

class MovimientosInitial extends MovimientosState {}

class MovimientosLoading extends MovimientosState {}

class MovimientosLoaded extends MovimientosState {
  final dynamic movimientosData; // Datos dinámicos.
  MovimientosLoaded(this.movimientosData);
}


class MovimientosError extends MovimientosState {
  final String message;
  MovimientosError(this.message);
}
