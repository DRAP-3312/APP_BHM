import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:equatable/equatable.dart';

abstract class ContactoEvent extends Equatable {
  const ContactoEvent();

  @override
  List<Object?> get props => [];
}

class LoadContactoDataEvent extends ContactoEvent {}

class CreateContactoEvent extends ContactoEvent {
  final Cuenta newContacto;

  const CreateContactoEvent(this.newContacto);

  @override
  List<Object?> get props => [newContacto];
}

