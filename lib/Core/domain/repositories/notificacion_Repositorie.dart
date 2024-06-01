
import 'package:bhm_app/Core/domain/models/notificacion_model.dart';

abstract class NotificacionRepository{
  Future<Notificacion> loadNotificacionData();
}