
import 'package:bhm_app/Core/domain/models/login_model.dart';

abstract class LoginRepository{
  Future<Login> LoadLoginData();
}