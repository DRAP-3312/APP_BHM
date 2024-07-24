import 'dart:convert';

import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:bhm_app/Core/domain/repositories/transferencia_Repositorie.dart';
import 'package:flutter/services.dart';

class TransferenciaRepositoryImpl implements TransferenciaRepository {
  @override
  Future<Transferencia> loadTransferenciaData() async {

    final response = await rootBundle.loadString('/assets/json_data/transferencia_data.json');
    final data = json.decode(response);
    return Transferencia.fromJson(data);
  }
}