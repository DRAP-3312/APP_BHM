import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';
import 'package:bhm_app/Core/domain/repositories/RegistroLogin_Repositorie.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class RegistroLoginRepositoryImpl implements RegistroLoginRepository {
  final Dio dio;
  final Logger logger = Logger();
  final String urlServer ='https://apimoviles-production.up.railway.app/users';  //'https://apimoviles-production.up.railway.app/users';

  RegistroLoginRepositoryImpl({required this.dio});

  @override
  Future<RegistroLogin> loadRegistroLoginData() async {
    final response = await rootBundle.loadString('assets/json_data/RegistroLogin_data.json');
    final data = json.decode(response);
    
    final registroLogin = RegistroLogin.fromJson(data);
    return registroLogin;
  }

  @override
  Future<bool> registerUser(RegistroLogin user) async {
    try {
      final response = await dio.post(
        urlServer,
        data: {
          'name': user.name,
          'lastname': user.lastname,
          'email': user.email,
          'rfc': user.rfc,
          'phone': user.phone,
          'password': user.password,
          'id_bank': user.id_banck,
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

