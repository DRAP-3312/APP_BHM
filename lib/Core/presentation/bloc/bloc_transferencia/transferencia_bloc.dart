import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:aplicaciones_moviles_app/domain/usecases/load_form_data.dart' as usecase;

class TransferenciaBloc extends Bloc<TransferenciaEvent, TranferenciaState> {
  //final usecase.LoadFormData loadFormData;

  //this.loadFormData
  TransferenciaBloc() : super(const TranferenciaState()) {
    on<LoadTransferenciaDataEvent>((event, emit) async {
      //final formData = await loadFormData();
      //emit(FormState.fromModel(formData));
    });

    on<NameContactoChanged>((event, emit) {
      emit(state.copyWith(
          nameContacto: event.nameContacto, isValid: _validateForm()));
    });
    on<MontoTransChanged>((event, emit) {
      emit(state.copyWith(
          montoTrans: event.montoTrans, isValid: _validateForm()));
    });
    on<FechaTransChanged>((event, emit) {
      emit(state.copyWith(
          fechaTrans: event.fechaTrans, isValid: _validateForm()));
    });
    on<SaldoDisponibleChanged>((event, emit) {
      emit(state.copyWith(
          saldoDisponible: event.saldoDisponible, isValid: _validateForm()));
    });

    on<TransferenciaSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.nameContacto.isNotEmpty &&
        state.montoTrans == 0 &&
        state.fechaTrans.isNotEmpty &&
        state.saldoDisponible == 0;
  }
}
