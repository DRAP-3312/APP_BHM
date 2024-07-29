import 'package:bhm_app/Core/domain/usecases/load_servicio_data.dart' as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_servicio/servicio_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_servicio/servicio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicioBloc extends Bloc<ServicioEvent, ServicioState> {
  final usecase.LoadServicioData loadServicioData;

  ServicioBloc(this.loadServicioData) : super(ServicioStateInitial()) {
    on<LoadServicioDataEvent>((event, emit) async {
      try {
        final servicioData = await loadServicioData();
        emit(ServicioStateLoaded(servicioData));
      } catch (e) {
        emit(const ServicioStateError('Failed to load services'));
      }
    });

    // Otros manejadores de eventos...
  }
}
