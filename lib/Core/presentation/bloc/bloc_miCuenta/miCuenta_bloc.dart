import 'package:bhm_app/Core/domain/usecases/load_miCuenta_data.dart' as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_miCuenta/miCuenta_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_miCuenta/miCuenta_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MiCuentaBloc extends Bloc<MiCuentaEvent, MiCuentaState> {
  final usecase.LoadMiCuentaData loadMiCuentaData;

  MiCuentaBloc(this.loadMiCuentaData) : super(const MiCuentaState()) {
    on<LoadMiCuentaDataEvent>((event, emit) async {
      try {
        final miCuentaData = await loadMiCuentaData();
        print('Datos recibidos en el Bloc: $miCuentaData');
        emit(MiCuentaState.fromModel(miCuentaData));
        print('Estado actualizado en el Bloc: ${MiCuentaState.fromModel(miCuentaData)}');
      } catch (e) {
        print('Error al cargar datos: $e');
        emit(state.copyWith(error: {'error': e.toString()}));
      }
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateForm(state.copyWith(name: event.name))));
    });
    on<LastnameChanged>((event, emit) {
      emit(state.copyWith(lastname: event.lastname, isValid: _validateForm(state.copyWith(lastname: event.lastname))));
    });
    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone, isValid: _validateForm(state.copyWith(phone: event.phone))));
    });
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, isValid: _validateForm(state.copyWith(email: event.email))));
    });
    on<RfcChanged>((event, emit) {
      emit(state.copyWith(rfc: event.rfc, isValid: _validateForm(state.copyWith(rfc: event.rfc))));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, isValid: _validateForm(state.copyWith(password: event.password))));
    });
    on<IdBankChanged>((event, emit) {
      emit(state.copyWith(id_bank: event.id_bank, isValid: _validateForm(state.copyWith(id_bank: event.id_bank))));
    });

    on<MiCuentaSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm(MiCuentaState state) {
    return state.name.isNotEmpty &&
        state.lastname.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.email.isNotEmpty &&
        state.rfc.isNotEmpty &&
        state.password.isNotEmpty &&
        state.id_bank != 0;
  }
}
