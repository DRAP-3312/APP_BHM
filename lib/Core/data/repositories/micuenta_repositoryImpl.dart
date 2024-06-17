import 'dart:convert';

import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/micuenta_Repositorie.dart';
import 'package:flutter/services.dart';

class MiCuentaRepositoryImpl implements MiCuentaRepository {
  @override
  Future<Micuenta> loadMiCuentaData() async {

    final response = await rootBundle.loadString('assets/json_data/micuenta_data.json');
    final data = json.decode(response);

    print(data);
    return Micuenta.fromJson(data);
  }
}