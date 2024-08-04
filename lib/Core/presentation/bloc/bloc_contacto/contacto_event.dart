import 'package:equatable/equatable.dart';

abstract class ContactoEvent extends Equatable {
  const ContactoEvent();

  @override
  List<Object?> get props => [];
}

class LoadContactoDataEvent extends ContactoEvent {}

class CreateContactoEvent extends ContactoEvent {
  final newContacto;

  const CreateContactoEvent(this.newContacto);

  @override
  List<Object?> get props => [newContacto];
}

class DeleteContactoEvent extends ContactoEvent {
  final int contactoId;

  const DeleteContactoEvent(this.contactoId);

  @override
  List<Object?> get props => [contactoId];
}
