import 'package:bhm_app/Core/domain/models/payment_model.dart';
import 'package:bhm_app/Core/domain/repositories/payment_Repositorie.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:dio/dio.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final Dio dio;
  final TokenStorage tokenStorage;
  final String rutaServer ='http://localhost:3000/log-services'; //'https://apimoviles-production.up.railway.app/log-services';

  PaymentRepositoryImpl(this.dio, this.tokenStorage);

  @override
  Future<void> postPayment(Payment payment) async {
    try {
      final token = await tokenStorage.getToken();
      final response = await dio.post(
        rutaServer,
        data: payment.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to post payment');
      }
    } catch (e) {
      throw Exception('error repositoriImpl: $e');
    }
  }
}
