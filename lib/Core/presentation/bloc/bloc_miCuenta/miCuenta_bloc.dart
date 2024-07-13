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
       print('Estado actualizado en el Bloc: $miCuentaData');
     } catch (e) {
       print('Error al cargar datos: $e');
     }
    });

    on<NumCuentaChanged>((event, emit) {
      emit(
          state.copyWith(numCuenta: event.numCuenta, isValid: _validateForm()));
    });
    on<UserChanged>((event, emit) {
      emit(state.copyWith(user: event.user, isValid: _validateForm()));
    });
    on<CellChanged>((event, emit) {
      emit(state.copyWith(cell: event.cell, isValid: _validateForm()));
    });
    on<UserEmailcChanged>((event, emit) {
      emit(
          state.copyWith(userEmail: event.userEmail, isValid: _validateForm()));
    });
    on<FotoPerfilChanged>((event, emit) {
      emit(state.copyWith(
          fotoPerfil: event.fotoPerfil, isValid: _validateForm()));
    });

    on<MiCuentaSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.numCuenta.isNotEmpty &&
        state.user.isNotEmpty &&
        state.cell.isNotEmpty &&
        state.userEmail.isNotEmpty &&
        state.fotoPerfil.isNotEmpty;
  }
}
