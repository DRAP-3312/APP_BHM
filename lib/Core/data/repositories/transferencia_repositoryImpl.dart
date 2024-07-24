import 'dart:convert';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:dio/dio.dart';
import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:bhm_app/Core/domain/repositories/transferencia_Repositorie.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class TransferenciaRepositoryImpl implements TransferenciaRepository {
  final Dio dio;
  final Logger logger = Logger();
  final TokenStorage tokenStorage;

  TransferenciaRepositoryImpl({required this.dio, required this.tokenStorage});

  @override
  Future<Transferencia> loadTransferenciaData() async {
    final response = await rootBundle.loadString('/assets/json_data/transferencia_data.json');
    final data = json.decode(response);
    final transferencia = Transferencia.fromJson(data);
    return transferencia;
  }
   @override
  Future<bool> transferenciauser(Transferencia trans) async {
    final token = await tokenStorage.getToken();
    if(token == null){
      throw Exception("Token not found");
    }
    try {
      final response = await dio.post(
        'https://apimoviles-production.up.railway.app/transferences',
        data: {
          'id_sender': trans.id_sender,
          'id_receptor': trans.id_receptor,
          'amount': trans.amount,
          'sender_account': trans.sender_account,
          'receptor_account': trans.recepto_account,
        },
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      logger.i('Error: $e');
      return false;
    }
  }
  
}