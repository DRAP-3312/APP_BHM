import 'dart:convert';

import 'package:bhm_app/Core/domain/models/notificacion_model.dart';
import 'package:bhm_app/Core/domain/repositories/notificacion_Repositorie.dart';
import 'package:flutter/services.dart';

class NotificacionRepositoryImpl implements NotificacionRepository {
  @override
  Future<Notificacion> LoadNotificacionData() async {

    final response = await rootBundle.loadString('/assets/json_data/notificacion_data.json');
    final data = json.decode(response);

    print(data);
    return Notificacion.fromJson(data);
  }
}