import 'package:equatable/equatable.dart';

abstract class ServicioEvent extends Equatable {
  const ServicioEvent();

  @override
  List<Object?> get props => [];
}

class LoadServicioDataEvent extends ServicioEvent {}
