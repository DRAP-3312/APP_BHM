import 'dart:convert';
import 'package:bhm_app/Core/domain/models/login_model.dart';
import 'package:bhm_app/Core/domain/repositories/login_Repositorie.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:bhm_app/service/globalUser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'package:logger/logger.dart';
// Importar la clase TokenStorage

class LoginRepositoryImpl implements LoginRepository {
  final Dio dio;
  final Logger logger = Logger();
  final TokenStorage tokenStorage;
  final String urlServer ='http://localhost:3000/auth/login';
      //'https://apimoviles-production.up.railway.app/auth/login'; 

  LoginRepositoryImpl({required this.dio, required this.tokenStorage});

  @override
  Future<Login> loadLoginData() async {
    try {
      final response =
          await rootBundle.loadString('assets/json_data/login_data.json');
      final data = json.decode(response);
      return Login.fromJson(data);
    } catch (e) {
      logger.e('Error loading login data: $e');
      rethrow;
    }
  }

  @override
  Future<bool> singIn(Login login) async {
    try {
      final response = await dio.post(
        urlServer,
        data: {"phone": login.userEmail, "password": login.password},
      );

      if (response.statusCode == 200 && response.data != null) {
        final token = response.data['access_token'];
        if (token != null) {
         
          // Guardar el token utilizando TokenStorage
          await tokenStorage.saveToken(token);
          final userInfo = await dio.get(
            'http://localhost:3000/users',
            //'https://apimoviles-production.up.railway.app/users', 
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
          final idUser = userInfo.data['data']['id'];
          final userName = '${userInfo.data['data']['name']} ${userInfo.data['data']['lastname']}';
           GlobalState().setUserId(int.parse(idUser.toString()));
           GlobalState().setNameUser(userName);
          return true;
        } else {
          logger.e('No access token found in response');
          return false;
        }
      } else {
        logger.e('Failed to sign in, status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      logger.e('Sign-in error: $e');
      return false;
    }
  }
}
