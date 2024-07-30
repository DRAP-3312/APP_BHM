import 'package:bhm_app/Core/data/repositories/cuenta_respositoryImpl.dart';
import 'package:bhm_app/Core/domain/usecases/load_contacto_data.dart' as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactoBloc extends Bloc<ContactoEvent, ContactoState> {
  final usecase.LoadContactoData loadContactoData;
  final CuentaRepositoryImpl servicioRepository;

  ContactoBloc(this.loadContactoData, this.servicioRepository) : super(ContactoStateInitial()) {
    on<LoadContactoDataEvent>(_onLoadContactoDataEvent);
    on<CreateContactoEvent>(_onCreateContactoEvent);
  }

  void _onLoadContactoDataEvent(LoadContactoDataEvent event, Emitter<ContactoState> emit) async {
    try {
      final cuentaData = await loadContactoData();
      emit(ContactoStateLoaded(cuentaData));
    } catch (e) {
      emit(const ContactoStateError('Failed to load Contacts'));
    }
  }

  void _onCreateContactoEvent(CreateContactoEvent event, Emitter<ContactoState> emit) async {
    try {
      await servicioRepository.createContacto(event.newContacto);
      final cuentaData = await loadContactoData();  // Recargar contactos
      emit(ContactoStateLoaded(cuentaData));  // Actualizar el estado con los nuevos datos
    } catch (e) {
      emit(ContactoStateError('Failed to create contact: ${e.toString()}'));
    }
  }
}
