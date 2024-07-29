import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:equatable/equatable.dart';

class ContactoState extends Equatable {
  const ContactoState();

  @override
  List<Object> get props => [];
}

class ContactoStateInitial extends ContactoState {}

class ContactoStateLoaded extends ContactoState {
  final List<Cuenta> contacto;

  const ContactoStateLoaded(this.contacto);


  @override
  List<Object> get props => [contacto];

}

class ContactoStateError extends ContactoState {
  final String error;

  const ContactoStateError(this.error);

  @override
  List<Object> get props  => [error];
}