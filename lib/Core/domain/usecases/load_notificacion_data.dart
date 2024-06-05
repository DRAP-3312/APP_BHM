import 'package:bhm_app/Core/domain/models/notificacion_model.dart';
import 'package:bhm_app/Core/domain/repositories/notificacion_Repositorie.dart';
import 'package:bhm_app/service/validDate.dart';

class LoadNotificacionData {
  final NotificacionRepository repository;

  LoadNotificacionData(this.repository);

  Future<Notificacion> call() async {
    final notifiData = await repository.loadNotificacionData();

    if (notifiData.nameRetiro.isEmpty) {
      throw Exception("nameRetiro no puede ser vacio");
    }

    if (notifiData.timeRetiro.isEmpty) {
      throw Exception("timeRetiro no puede ser vacio");
    }
    if (!isValidDateFormat(notifiData.timeRetiro)) {
      throw Exception("timeRetiro formato invalido. Debe ser dd/mm/yyyy");
    }

    return notifiData;
  }
}
