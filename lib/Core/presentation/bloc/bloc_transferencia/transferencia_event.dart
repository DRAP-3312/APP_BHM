import 'package:equatable/equatable.dart';
import 'package:bhm_app/Core/domain/models/transferencia_model.dart';

abstract class TransferenciaEvent extends Equatable {
  const TransferenciaEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransferencia extends TransferenciaEvent {}

class CreateTransferencia extends TransferenciaEvent {
  final Transferencia transferencia;

  const CreateTransferencia(this.transferencia);

  @override
  List<Object> get props => [transferencia];
}
