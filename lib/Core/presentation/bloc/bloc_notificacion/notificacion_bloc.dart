import 'package:bhm_app/Core/presentation/bloc/bloc_notificacion/notificacion_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_notificacion/notificacion_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:aplicaciones_moviles_app/domain/usecases/load_form_data.dart' as usecase;


class NotificacionBloc extends Bloc<NotificacionEvent, NotificacionState> {
  //final usecase.LoadFormData loadFormData;

  //this.loadFormData
  NotificacionBloc() : super(const NotificacionState()) {
    on<LoadNotificacionDataEvent>((event, emit) async {
      //final formData = await loadFormData();
      //emit(FormState.fromModel(formData));
    });

    on<NameRetiroChanged>((event, emit) {
      emit(state.copyWith(nameRetiro: event.nameRetiro, isValid: _validateForm()));
    });
    on<TimeRetiroChanged>((event, emit) {
      emit(state.copyWith(timeRetiro: event.timeRetiro, isValid: _validateForm()));
    });

    on<NotificacionSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle form submission logic
      }
    });
  }

  bool _validateForm() {
    return state.nameRetiro.isNotEmpty &&
        state.timeRetiro.isNotEmpty;
  }
}
