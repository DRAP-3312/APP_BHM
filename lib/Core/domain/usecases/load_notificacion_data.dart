import 'package:bhm_app/Core/domain/models/notificacion_model.dart';
import 'package:bhm_app/Core/domain/repositories/notificacion_Repositorie.dart';

class LoadNotificacionData {
  final NotificacionRepository repository;

  LoadNotificacionData(this.repository);

  Future<Notificacion> call() async {
    final notifiData = await repository.loadNotificacionData();

    // Validaciones
    if (notifiData.nameRetiro.isEmpty) {
      throw Exception("nameRetiro cannot be empty");
    }
    if (notifiData.timeRetiro.isEmpty) {
      throw Exception("timeRetiro cannot be empty");
    }

    return notifiData;
  }
}
