import 'package:equatable/equatable.dart';
import 'package:bhm_app/Core/domain/models/transferencia_model.dart';

abstract class TransferenciaState extends Equatable {
  const TransferenciaState();

  @override
  List<Object?> get props => [];
}

class TransferenciaInitial extends TransferenciaState {}

class TransferenciaLoading extends TransferenciaState {}

class TransferenciaLoaded extends TransferenciaState {
  final Transferencia transferencia;

  const TransferenciaLoaded(this.transferencia);

  @override
  List<Object> get props => [transferencia];
}

class TransferenciaError extends TransferenciaState {
  final String message;

  const TransferenciaError(this.message);
  

  @override
  List<Object> get props => [message];
}
