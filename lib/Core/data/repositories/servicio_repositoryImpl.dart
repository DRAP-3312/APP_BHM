import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:bhm_app/Core/domain/repositories/servicio_Repositorie.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ServicioRepositoryImpl implements ServicioRepository {
  final Dio dio;
  final TokenStorage tokenStorage;
  final Logger logger = Logger();
  final String urlServer = 'http://localhost:3000/services'; //'https://apimoviles-production.up.railway.app/services'; 

  ServicioRepositoryImpl(this.dio, this.tokenStorage);

  @override
  Future<List<Servicio>> loadServicioData() async {
    final token = await tokenStorage.getToken();
    if (token == null) {
      throw Exception('Token no encontrado');
    }
    final response = await dio.get(
      urlServer,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((json) => Servicio.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }
}
