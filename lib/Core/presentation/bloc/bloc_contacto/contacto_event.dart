import 'package:equatable/equatable.dart';

abstract class ContactoEvent extends Equatable {
  const ContactoEvent();

  @override
  List<Object?> get props => [];
}

class LoadContactoDataEvent extends ContactoEvent {}
