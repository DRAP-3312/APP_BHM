import 'package:bhm_app/Core/presentation/bloc/bloc_servicio/servicio_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_servicio/servicio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:aplicaciones_moviles_app/domain/usecases/load_form_data.dart' as usecase;

class ServicioBloc extends Bloc<ServicioEvent, ServicioState> {
  //final usecase.LoadFormData loadFormData;

  //this.loadFormData
  ServicioBloc() : super(const ServicioState()) {
    on<LoadServicioDataEvent>((event, emit) async {
      //final formData = await loadFormData();
      //emit(FormState.fromModel(formData));
    });

    on<MontoPagoChanged>((event, emit) {
      emit(
          state.copyWith(montoPago: event.montoPago, isValid: _validateForm()));
    });
    on<ReferenciaChanged>((event, emit) {
      emit(state.copyWith(
          referencia: event.referencia, isValid: _validateForm()));
    });
    on<FechaChanged>((event, emit) {
      emit(state.copyWith(fecha: event.fecha, isValid: _validateForm()));
    });

    on<ServicioSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.montoPago==0 && state.referencia.isNotEmpty && state.fecha.isNotEmpty;
  }
}
