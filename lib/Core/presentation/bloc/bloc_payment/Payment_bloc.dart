import 'package:bhm_app/Core/domain/usecases/load_payment_data.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_payment/Payment_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_payment/Payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PostPayment postPayment;

  PaymentBloc(this.postPayment) : super(PaymentInitial()) {
    on<PostPaymentEvent>((event, emit) async {
      emit(PaymentLoading());
      try {
        await postPayment(event.payment);
        emit(PaymentSuccess());
      } catch (e) {
        emit(PaymentFailure(e.toString()));
      }
    });
  }
}
