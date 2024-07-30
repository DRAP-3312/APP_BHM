import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/domain/repositories/cuenta_Repositorie.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:dio/dio.dart';

class CuentaRepositoryImpl implements CuentaRepository {
  final Dio dio;
  final TokenStorage tokenStorage;
  final String rutaServer = 'http://localhost:3000/contacts';
  ////'https://apimoviles-production.up.railway.app/contacts'
  CuentaRepositoryImpl(this.dio, this.tokenStorage);
  @override
  Future<List<Cuenta>> loadCuentaData() async {
    final token = await tokenStorage.getToken();
    if (token == null) {
      throw Exception('Token no encontrado');
    }
    final response = await dio.get(rutaServer,
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    if (response.statusCode == 200) {
      //cargar datos de user
      // final response = await dio.get('', options: Options(
      //   headers: {'Authorization': 'Bearer $token'}
      // ));

      List<dynamic> data = response.data['data'];
      return data.map((json) => Cuenta.fromJson(json)).toList();
    } else {
      throw Exception(' Failed to load contacts');
    }
  }

  Future<bool> createContacto(Cuenta contacto) async {
    try {
      final token = await tokenStorage.getToken();
      final response = await dio.post(
        rutaServer,
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
