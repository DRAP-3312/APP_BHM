import 'package:bhm_app/Core/data/repositories/payment_repositoryImpl.dart';
import 'package:bhm_app/Core/domain/models/payment_model.dart';
import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:bhm_app/Core/domain/usecases/load_payment_data.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_payment/Payment_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_payment/Payment_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_payment/Payment_state.dart';
import 'package:bhm_app/Core/presentation/screens/Confirmacion.dart';
import 'package:bhm_app/Core/presentation/screens/Services.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:bhm_app/service/globalUser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MontoServicio extends StatefulWidget {
  final Servicio servicio;
  MontoServicio({required this.servicio});

  @override
  _MontoServicio createState() => _MontoServicio();
}

class _MontoServicio extends State<MontoServicio> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _idServiceController = TextEditingController();
  final TextEditingController _idUserController = TextEditingController();
  final TextEditingController _idAccountController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Asignar valores iniciales a los controladores
    _idServiceController.text = widget.servicio.id.toString();
      _idUserController.text = GlobalState().getUserId().toString();
    _idAccountController.text = GlobalState().getIdAccount().toString();
    _referenceController.text = widget.servicio.name;
  }

  @override
  Widget build(BuildContext context) {
    final tokenStorage = TokenStorage();
    _focusNode.requestFocus();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),
        title: const Text(
          'Cantidad a pagar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Services()),
            );
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => PaymentBloc(
            PostPayment(PaymentRepositoryImpl(Dio(), tokenStorage))),
        child: BlocListener<PaymentBloc, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmacionPagoServicio(
                    valorSaldo: _amountController.text,
                    servicio: widget.servicio,
                  ),
                ),
              );
            } else if (state is PaymentFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          child: BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _amountController,
                      focusNode: _focusNode,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '0',
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Saldo disponible',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '10.000\$',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Visibility(
                      visible: false,
                      child: TextField(
                        controller: _idServiceController,
                        decoration: const InputDecoration(
                          labelText: 'ID del Servicio',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Visibility(
                      visible: false,
                      child: TextField(
                        controller: _idUserController,
                        decoration: const InputDecoration(
                          labelText: 'ID del Usuario',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Visibility(
                      visible: false,
                      child: TextField(
                        controller: _idAccountController,
                        decoration: const InputDecoration(
                          labelText: 'ID de la Cuenta',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _referenceController,
                      decoration: const InputDecoration(
                        labelText: 'Referencia',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        try {
                          final payment = Payment(
                            id_service: int.parse(_idServiceController.text),
                            id_users: int.parse(_idUserController.text),
                            id_account: int.parse(_idAccountController.text),
                            amount: int.parse(_amountController.text),
                            reference: _referenceController.text,
                          );
                          BlocProvider.of<PaymentBloc>(context)
                              .add(PostPaymentEvent(payment));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $e')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Confirmar Pago'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
