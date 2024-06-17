import 'dart:convert';

import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:bhm_app/Core/domain/repositories/transferencia_Repositorie.dart';
import 'package:flutter/services.dart';

class TransferenciaRepositoryImpl implements TransferenciaRepository {
  @override
  Future<Transferencia> loadTransferenciaData() async {
    try{
    final response = await rootBundle.loadString('/assets/json_data/transferencia_data.json');
    final data = json.decode(response);

    
      print('Datos cargados del JSON: $data');
      final miTransferencia = Transferencia.fromJson(data);
      print('Datos convertidos a modelo: $miTransferencia');
      return miTransferencia;
    } catch (e) {
      print('Error cargando los datos: $e');
      throw Exception('Error al cargar los datos de la cuenta');
    
  }
}
}
