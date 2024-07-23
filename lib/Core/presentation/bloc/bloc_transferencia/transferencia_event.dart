import 'package:equatable/equatable.dart';

abstract class TransferenciaEvent extends Equatable {
  const TransferenciaEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransferenciaDataEvent extends TransferenciaEvent {}

class NameContactoChanged extends TransferenciaEvent {
  final String nameContacto;

  const NameContactoChanged(this.nameContacto);

  @override
  List<Object?> get props => [nameContacto];
}

class MontoTransChanged extends TransferenciaEvent {
  final int amount;

  const MontoTransChanged(this.amount);

  @override
  List<Object?> get props => [amount];
}

class FechaTransChanged extends TransferenciaEvent {
  final String fechaTrans;

  const FechaTransChanged(this.fechaTrans);

  @override
  List<Object?> get props => [fechaTrans];
}

class SaldoDisponibleChanged extends TransferenciaEvent {
  final double saldoDisponible;

  const SaldoDisponibleChanged(this.saldoDisponible);

  @override
  List<Object?> get props => [saldoDisponible];
}

class TransferenciaSubmitted extends TransferenciaEvent {}
