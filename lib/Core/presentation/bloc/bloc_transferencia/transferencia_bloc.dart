import 'package:bhm_app/Core/data/repositories/transferencia_repositoryImpl.dart';
import 'package:bhm_app/Core/domain/usecases/load_transferencia_data.dart' as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/domain/repositories/transferencia_repositorie.dart';


class TransferenciaBloc extends Bloc<TransferenciaEvent, TranferenciaState> {
  final usecase.LoadTransferenciaData loadTransferenciaData;
  final TransferenciaRepository repository;

  TransferenciaBloc(this.loadTransferenciaData, this.repository) : super(const TranferenciaState()) {
    on<LoadTransferenciaDataEvent>((event, emit) async {
      final transferData = await loadTransferenciaData();
      emit(TranferenciaState.fromModel(transferData));
    });

    on<NameContactoChanged>((event, emit) {
      emit(state.copyWith(
          nameContacto: event.nameContacto, isValid: _validateForm()));
    });
    on<MontoTransChanged>((event, emit) {
      emit(state.copyWith(
          amount: event.amount, isValid: _validateForm()));
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
        state.amount == 0 &&
        state.fechaTrans.isNotEmpty &&
        state.saldoDisponible == 0;
  }
}
