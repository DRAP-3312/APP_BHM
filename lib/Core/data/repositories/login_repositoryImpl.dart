import 'dart:convert';

import 'package:bhm_app/Core/domain/models/login_model.dart';
import 'package:bhm_app/Core/domain/repositories/login_Repositorie.dart';
import 'package:flutter/services.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Login> LoadLoginData() async {

    final response = await rootBundle.loadString('/assets/json_data/login_data.json');
    final data = json.decode(response);

    print(data);
    return Login.fromJson(data);
  }
}