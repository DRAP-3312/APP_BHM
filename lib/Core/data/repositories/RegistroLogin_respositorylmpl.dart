
import 'dart:convert';

import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';
import 'package:bhm_app/Core/domain/repositories/RegistroLogin_Repositorie.dart';
import 'package:flutter/services.dart';

class RegistroLoginRepositoryImpl implements RegistroLoginRepository {
  @override
  Future<RegistroLogin> loadRegistroLoginData() async {

    final response = await rootBundle.loadString('/assets/json_data/RegistroLogin_data.json');
    final data = json.decode(response);

    print(data);
    return RegistroLogin.fromJson(data);
  }
}