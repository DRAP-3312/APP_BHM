import 'package:equatable/equatable.dart';
import 'package:bhm_app/Core/domain/models/payment_model.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class PostPaymentEvent extends PaymentEvent {
  final Payment payment;

  const PostPaymentEvent(this.payment);

  @override
  List<Object> get props => [payment];
}
