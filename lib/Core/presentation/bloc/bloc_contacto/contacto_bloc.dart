import 'package:bhm_app/Core/domain/usecases/load_contacto_data.dart'
    as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactoBloc extends Bloc<ContactoEvent, ContactoState> {
  final usecase.LoadContactoData loadContactoData;

  ContactoBloc(this.loadContactoData) : super(ContactoStateInitial()) {
    on<LoadContactoDataEvent>((event, emit) async {
      try {
        final cuentaData = await loadContactoData();
        emit(ContactoStateLoaded(cuentaData));
      } catch (e) {
        emit(const ContactoStateError('Failed to load Contacts'));
      }
    });
  }
}
