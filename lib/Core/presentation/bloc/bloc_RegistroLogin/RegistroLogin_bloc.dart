import 'package:bhm_app/Core/domain/usecases/load_RegistroLogin_data.dart'
    as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_RegistroLogin/RegistroLogin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistroLoginBloc extends Bloc<RegistroLoginEvent, RegistroLoginState> {
  final usecase.LoadRegistroDataData loadRegistroLoginData;

    RegistroLoginBloc(this.loadRegistroLoginData)
      : super(const RegistroLoginState()) {
    on<LoadRegistroLoginDataEvent>((event, emit) async {
      try {
        final registroLoginData = await loadRegistroLoginData();
        print('Datos recibidos en el Bloc: $registroLoginData'); // Verificar datos
        emit(RegistroLoginState.fromModel(registroLoginData));
        print('Estado actualizado en el Bloc: $registroLoginData'); // Verificar estado actualizado
      } catch (e) {
        print('Error al cargar datos: $e'); // Capturar cualquier error
      }
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateForm()));
    });
    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(lastname: event.lastname, isValid: _validateForm()));
    });
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, isValid: _validateForm()));
    });
    on<RfcChanged>((event, emit) {
      emit(state.copyWith(rfc: event.rfc, isValid: _validateForm()));
    });
    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone, isValid: _validateForm()));
    });
    on<PassowordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, isValid: _validateForm()));
    });
    on<IdbanckChanged>((event, emit) {
      emit(state.copyWith(id_banck: event.id_banck, isValid: _validateForm()));
    });

    on<RegistroLoginSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.name.isNotEmpty &&
        state.lastname.isNotEmpty &&
        state.email.isNotEmpty &&
        state.rfc.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.password.isNotEmpty &&
        state.id_banck == 0;
  }
}
