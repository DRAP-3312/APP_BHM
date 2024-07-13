import 'dart:convert';
import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/micuenta_Repositorie.dart';
import 'package:flutter/services.dart';

class MiCuentaRepositoryImpl implements MiCuentaRepository {
  @override
  Future<Micuenta> loadMiCuentaData() async {
    try {
      final response = await rootBundle.loadString('assets/json_data/micuenta_data.json');
      final data = json.decode(response);

      print('Datos cargados del JSON: $data');
      final miCuentaLogin = Micuenta.fromJson(data);
      print('Datos convertidos a modelo: $miCuentaLogin');
      return miCuentaLogin;
    } catch (e) {
      print('Error cargando los datos: $e');
      throw Exception('Error al cargar los datos de la cuenta');
    }
  }
}
