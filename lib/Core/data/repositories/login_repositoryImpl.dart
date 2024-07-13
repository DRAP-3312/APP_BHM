import 'dart:convert';

import 'package:bhm_app/Core/domain/models/login_model.dart';
import 'package:bhm_app/Core/domain/repositories/login_Repositorie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class LoginRepositoryImpl implements LoginRepository {
  final Dio dio;
  final Logger logger = Logger();

  LoginRepositoryImpl({required this.dio});
  @override
  Future<Login> loadLoginData() async {
    final response =
        await rootBundle.loadString('/assets/json_data/login_data.json');
    final data = json.decode(response);

    logger.i(data);
    return Login.fromJson(data);
  }

  @override
  Future<bool> singIn(Login login) async {
    try {
      final response = await dio.post(
        'https://apimoviles-production.up.railway.app/auth/login',
        data: {"phone": login.userEmail, "password": login.password},
      );

      if (response.statusCode == 200) {
        final token = response.data['access_token'];
        logger.i('El token: $token');

        // Guardar el token en las SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', token);

        SharedPreferences leer = await SharedPreferences.getInstance();
        String? clave = leer.getString('access_token');

        if (token != null) {
          // Usa el token para hacer una solicitud autenticada, por ejemplo
          logger.i('El token recuperado: $clave');
        } else {
          logger.i('No hay token guardado');
        }
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
