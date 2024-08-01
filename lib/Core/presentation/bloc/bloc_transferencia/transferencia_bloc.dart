import 'package:bhm_app/Core/data/repositories/transferencia_repositoryImpl.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class TransferenciaBloc extends Bloc<TransferenciaEvent, TransferenciaState> {
  final TransferenciaRepositoryImpl transferenciaRepository;

  TransferenciaBloc(this.transferenciaRepository) : super(TransferenciaInitial()) {
    on<LoadTransferencia>((event, emit) async {
      emit(TransferenciaLoading());
      try {
        final transferencia = await transferenciaRepository.loadTransferenciaData();
        emit(TransferenciaLoaded(transferencia));
      } catch (e) {
        emit(TransferenciaError(e.toString()));
      }
    });

    on<CreateTransferencia>((event, emit) async {
      emit(TransferenciaLoading());
      try {
        await transferenciaRepository.createTransfer(event.transferencia);
        emit(TransferenciaLoaded(event.transferencia)); 
      } catch (e) {
        emit(TransferenciaError(e.toString()));
      }
    });
  }
}
