import 'package:bhm_app/Core/domain/repositories/movimientos_Repositorie.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_movimientos/movimientos_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_movimientos/movimientos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MovimientosBloc extends Bloc<MovimientosEvent, MovimientosState> {
  final MovimientosRepository movimientosRepository;

  MovimientosBloc(this.movimientosRepository) : super(MovimientosInitial()) {
    on<LoadMovimientosEvent>((event, emit) async {
      emit(MovimientosLoading());
      try {
        final dynamic movimientosData = await movimientosRepository.loadMovimientos();
        emit(MovimientosLoaded(movimientosData));
      } catch (e) {
        emit(MovimientosError(e.toString()));
      }
    });
  }
}
