
import 'dart:convert';

import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/cuenta_Repositorie.dart';
import 'package:flutter/services.dart';

class CuentaRepositoryImpl implements CuentaRepository {
  @override
  Future<Cuenta> loadCuentaData() async {

    final response = await rootBundle.loadString('/assets/json_data/cuenta_data.json');
    final data = json.decode(response);

    print(data);
    return Cuenta.fromJson(data);
  }
}