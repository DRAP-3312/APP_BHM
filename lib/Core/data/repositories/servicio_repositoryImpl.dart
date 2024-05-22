import 'dart:convert';

import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:bhm_app/Core/domain/repositories/servicio_Repositorie.dart';
import 'package:flutter/services.dart';

class ServicioRepositoryImpl implements ServicioRepository {
  @override
  Future<Servicio> LoadServicioData() async {

    final response = await rootBundle.loadString('/assets/json_data/servicio_data.json');
    final data = json.decode(response);

    print(data);
    return Servicio.fromJson(data);
  }
}