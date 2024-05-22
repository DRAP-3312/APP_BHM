
import 'dart:convert';

import 'package:bhm_app/Core/domain/models/inicio_model.dart';
import 'package:bhm_app/Core/domain/repositories/inicio_Repositorie.dart';
import 'package:flutter/services.dart';

class InicioRepositoryImpl implements InicioRepository {
  @override
  Future<Inicio> LoadInicioData() async {

    final response = await rootBundle.loadString('/assets/json_data/inicio_data.json');
    final data = json.decode(response);

    print(data);
    return Inicio.fromJson(data);
  }
}