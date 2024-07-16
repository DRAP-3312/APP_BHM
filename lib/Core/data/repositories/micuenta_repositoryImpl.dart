import 'dart:convert';
import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/micuenta_Repositorie.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class MiCuentaRepositoryImpl implements MiCuentaRepository {
  final Dio dio;
  final TokenStorage tokenStorage;

  MiCuentaRepositoryImpl(this.dio, this.tokenStorage);

  @override
  Future<Micuenta> loadMiCuentaData() async {
    final token = await tokenStorage.getToken();
    if(token == null){
      throw Exception('Token no encontrado');   
    } 
    final response = await dio.get(
      'https://apimoviles-production.up.railway.app/users',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    final responseData = response.data['data'];
    return Micuenta.fromJson(responseData);
  }

  @override
  Future<void> updateUserData(Micuenta user) async {
    final token = await tokenStorage.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    await dio.patch(
      'https://apimoviles-production.up.railway.app/users',
      data: user.toJson(),
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }
}
