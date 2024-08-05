import 'package:bhm_app/Core/domain/models/movimientos_model.dart';
import 'package:bhm_app/Core/domain/repositories/movimientos_Repositorie.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class MovimientosRepositoryImpl implements MovimientosRepository {
  final Dio dio;
  final TokenStorage tokenStorage;
  final Logger logger = Logger();
  final String urlService = 'https://apimoviles-production.up.railway.app/log-services';
  final String urlTransfer = 'https://apimoviles-production.up.railway.app/transferences';

  MovimientosRepositoryImpl(this.dio, this.tokenStorage);

  @override
  Future<dynamic> loadMovimientos() async {
    final token = await tokenStorage.getToken();
    if (token == null) {
      throw Exception('Token no encontrado');
    }

    final responseServicios = await dio.get(urlService,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));
    final responseTransferencias = await dio.get(urlTransfer,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ));

    if (responseServicios.statusCode == 200 ||
        responseTransferencias.statusCode == 200) {
      
      return {
        "services": responseServicios.data,
        "transfer": responseTransferencias.data,
      };
    }
    return Movimientos(servicios: [], transferencias: []);
  }
}
