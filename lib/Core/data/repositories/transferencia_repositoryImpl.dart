import 'dart:convert';

import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:bhm_app/Core/domain/repositories/transferencia_Repositorie.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class TransferenciaRepositoryImpl implements TransferenciaRepository {
  final Logger logger = Logger();
  final Dio dio;
  final String urlServer = 'http://localhost:3000/transferences';
  final TokenStorage tokenStorage;

  TransferenciaRepositoryImpl(this.dio, this.tokenStorage);
  @override
  Future<Transferencia> loadTransferenciaData() async {
    final response = await rootBundle
        .loadString('/assets/json_data/transferencia_data.json');
    final data = json.decode(response);
    return Transferencia.fromJson(data);
  }

  Future<void> createTransfer(Transferencia trasnfer) async {
    try {
      final token = await tokenStorage.getToken();
      final response = await dio.post(urlServer,
          data: trasnfer.toJson(),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));

      if (response.statusCode != 201) {
        throw Exception('Failed to post payment');
      }
    } catch (e) {
      throw Exception('Transaccion fallida');
    }
  }
}
