import 'dart:convert';

import 'package:bhm_app/Core/domain/models/inicio_model.dart';
import 'package:bhm_app/Core/domain/repositories/inicio_Repositorie.dart';
import 'package:flutter/services.dart';

class InicioRepositoryImpl implements InicioRepository {
  @override
  Future<Inicio> loadInicioData() async {
    final response = await rootBundle.loadString('assets/json_data/inicio_data.json');
    final data = json.decode(response);

    // print('Datos cargados del JSON: $data');
    final inicio = Inicio.fromJson(data);
    // print('Datos convertidos a modelo: $inicio');
    return inicio;
  }
}