import 'package:equatable/equatable.dart';

abstract class NotificacionEvent extends Equatable {
  const NotificacionEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotificacionDataEvent extends NotificacionEvent {}

class NameRetiroChanged extends NotificacionEvent {
  final String nameRetiro;

  const NameRetiroChanged(this.nameRetiro);

  @override
  List<Object?> get props => [nameRetiro];
}

class TimeRetiroChanged extends NotificacionEvent {
  final String timeRetiro;

  const TimeRetiroChanged(this.timeRetiro);

  @override
  List<Object?> get props => [timeRetiro];
}


class NotificacionSubmitted extends NotificacionEvent {}
