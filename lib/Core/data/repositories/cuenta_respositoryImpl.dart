import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/cuenta_Repositorie.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:bhm_app/service/globalUser.dart';
import 'package:dio/dio.dart';

class CuentaRepositoryImpl implements CuentaRepository {
  final Dio dio;
  final TokenStorage tokenStorage;
  final String rutaContacto = 'http://localhost:3000/contacts';
  final String rutaInfo = 'http://localhost:3000/accounts/me';
  ////'https://apimoviles-production.up.railway.app/contacts'
  CuentaRepositoryImpl(this.dio, this.tokenStorage);
  @override
  Future<List<Cuenta>> loadCuentaData() async {
    final token = await tokenStorage.getToken();
    if (token == null) {
      throw Exception('Token no encontrado');
    }
    final response = await dio.get(rutaContacto,
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    if (response.statusCode == 200) {
      final infoCompletaUser = await dio.get(
        rutaInfo,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final balance = infoCompletaUser.data['data']['balance'];
      GlobalState().setBalance(balance);
      List<dynamic> data = response.data['data'];
      // print(data);
      // print('XXXXXXXXXXXXXXXXXXXXXX');
      // print(marchear);
      return data.map((json) => Cuenta.fromJson(json)).toList();
    } else {
      throw Exception(' Failed to load contacts');
    }
  }

  Future<bool> deleteContacto(int id) async {
     final token = await tokenStorage.getToken();
    try {
      final response = await dio.delete(
        '$rutaContacto/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if(response.statusCode ==200){
        return true;
      }
      return false;
    } catch (e) {
      throw Exception('Error repo delete: $e');
    }
  }

  Future<bool> createContacto(Cuenta contacto) async {
    try {
      final token = await tokenStorage.getToken();
      final response = await dio.post(
        rutaContacto,
        data: {
          "id_user": contacto.id_user,
          "nickname": contacto.nickname,
          "account": contacto.account,
          "email": contacto.email,
          "phone": contacto.phone,
          "bankname": contacto.bankname
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error repo create: $e');
    }
  }
}
