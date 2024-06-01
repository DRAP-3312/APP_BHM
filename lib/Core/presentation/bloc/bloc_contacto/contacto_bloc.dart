
import 'package:bhm_app/Core/domain/usecases/load_contacto_data.dart' as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ContactoBloc extends Bloc<ContactoEvent, ContactoState> {
  final usecase.LoadContactoData loadContactoData;

  ContactoBloc(this.loadContactoData) : super(const ContactoState()) {
    on<LoadContactoDataEvent>((event, emit) async {
      final cuentaData = await loadContactoData();
      emit(ContactoState.fromModel(cuentaData));
    });

    on<NameContactoChanged>((event, emit) {
      emit(state.copyWith(nameContacto: event.nameContacto, isValid: _validateForm()));
    });
    on<AliasContactoChanged>((event, emit) {
      emit(state.copyWith(aliasContacto: event.aliasContacto, isValid: _validateForm()));
    });
    on<NumtarjetChanged>((event, emit) {
      emit(state.copyWith(numTarjet: event.numTarjet, isValid: _validateForm()));
    });
    on<FotoPerfilChanged>((event, emit) {
      emit(state.copyWith(fotoPerfil: event.fotoPerfil, isValid: _validateForm()));
    });
    on<ContactoSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.nameContacto.isNotEmpty &&
        state.aliasContacto.isNotEmpty &&
        state.numTarjet.isNotEmpty &&
        state.fotoPerfil.isNotEmpty ;
  }
}
