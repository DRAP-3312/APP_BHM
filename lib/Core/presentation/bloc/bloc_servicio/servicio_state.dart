import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:equatable/equatable.dart';

abstract class ServicioState extends Equatable {
  const ServicioState();

  @override
  List<Object?> get props => [];
}

class ServicioStateInitial extends ServicioState {}

class ServicioStateLoaded extends ServicioState {
  final List<Servicio> servicios;

  const ServicioStateLoaded(this.servicios);

  @override
  List<Object?> get props => [servicios];
}

class ServicioStateError extends ServicioState {
  final String error;

  const ServicioStateError(this.error);

  @override
  List<Object?> get props => [error];
}
