import 'package:bhm_app/Core/domain/models/payment_model.dart';
import 'package:bhm_app/Core/domain/repositories/payment_Repositorie.dart';


class PostPayment {
  final PaymentRepository repository;

  PostPayment(this.repository);

  Future<void> call(Payment payment) async {
    return await repository.postPayment(payment);
  }
}
