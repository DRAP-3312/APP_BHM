// import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';


// abstract class RegistroLoginRepository{
//   Future<RegistroLogin> loadRegistroLoginData();
// }

import 'package:bhm_app/Core/domain/models/Registro_Login_model.dart';

abstract class RegistroLoginRepository {
  Future<RegistroLogin> loadRegistroLoginData();
  Future<bool> registerUser(RegistroLogin user);
}
