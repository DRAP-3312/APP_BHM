import 'package:bhm_app/Core/domain/models/notificacion_model.dart';
import 'package:equatable/equatable.dart';

class NotificacionState extends Equatable {
  final String nameRetiro;
  final String timeRetiro;
  final bool isValid;


  const NotificacionState({
    this.nameRetiro = '',
    this.timeRetiro = '',
    this.isValid = false,
  });

  factory NotificacionState.fromModel(Notificacion model) {
    return NotificacionState(
      nameRetiro: model.nameRetiro,
      timeRetiro: model.timeRetiro,
      isValid: true,
    );
  }

  NotificacionState copyWith({
    String? nameRetiro,
    String? timeRetiro,
    bool? isValid,
  }) {
    return NotificacionState(
      nameRetiro: nameRetiro ?? this.nameRetiro,
      timeRetiro: timeRetiro ?? this.timeRetiro,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        nameRetiro,
        timeRetiro,
        isValid,
      ];
}
