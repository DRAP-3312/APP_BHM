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
  final String urlLogin = 'https://apimoviles-production.up.railway.app/auth/login';
  final String urlInfo = 'https://apimoviles-production.up.railway.app/accounts/me';
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
        urlLogin,
        data: {"phone": login.userEmail, "password": login.password},
      );

      if (response.statusCode == 200 && response.data != null) {
        final token = response.data['access_token'];
        if (token != null) {
          // Guardar el token utilizando TokenStorage
          await tokenStorage.saveToken(token);
          final infoCompletaUser = await dio.get(
            urlInfo,
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
          final balance = infoCompletaUser.data['data']['balance'];
          final idUser = infoCompletaUser.data['data']['user']['id'];
          final idAccount =
              infoCompletaUser.data['data']['card'][0]['id_account'];
          final userName =
              '${infoCompletaUser.data['data']['user']['name']} ${infoCompletaUser.data['data']['user']['lastname']}';
          final card = infoCompletaUser.data['data']['card'][0]['card'];
          GlobalState().setUserId(int.parse(idUser.toString()));
          GlobalState().setNameUser(userName);
          GlobalState().setidAccount(int.parse(idAccount.toString()));
          GlobalState().setCard(card);
          GlobalState().setBalance(balance);
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
