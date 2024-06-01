import 'package:bhm_app/Core/domain/usecases/load_notificacion_data.dart' as usecase;
import 'package:bhm_app/Core/presentation/bloc/bloc_notificacion/notificacion_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_notificacion/notificacion_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class NotificacionBloc extends Bloc<NotificacionEvent, NotificacionState> {
  final usecase.LoadNotificacionData loadNotificacionData;

  NotificacionBloc(this.loadNotificacionData) : super(const NotificacionState()) {
    on<LoadNotificacionDataEvent>((event, emit) async {
      final notifiData = await loadNotificacionData();
      emit(NotificacionState.fromModel(notifiData));
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
