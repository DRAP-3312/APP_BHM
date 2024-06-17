import 'dart:convert';
import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';
import 'package:bhm_app/Core/domain/repositories/RegistroLogin_Repositorie.dart';
import 'package:flutter/services.dart';

class RegistroLoginRepositoryImpl implements RegistroLoginRepository {
  @override
  Future<RegistroLogin> loadRegistroLoginData() async {
    final response = await rootBundle.loadString('assets/json_data/RegistroLogin_data.json');
    final data = json.decode(response);
    
    //print('Datos cargados del JSON: $data'); // Verificar los datos del JSON
    final registroLogin = RegistroLogin.fromJson(data);
    //print('Datos convertidos a modelo: $registroLogin'); // Verificar conversión a modelo
    return registroLogin;
  }
}
