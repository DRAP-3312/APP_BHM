import 'package:bhm_app/Core/domain/models/payment_model.dart';

abstract class PaymentRepository {
  Future<void> postPayment(Payment payment);
}
