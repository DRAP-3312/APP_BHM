import 'package:bhm_app/Core/domain/repositories/transferencia_repositorie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/domain/usecases/load_transferencia_data.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_state.dart';
import 'package:bhm_app/Core/data/repositories/transferencia_repositoryimpl.dart';
import 'package:bhm_app/service/my_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferenciaBloc(
        LoadTransferenciaData(TransferenciaRepositoryImpl(dio: Dio())),
        TransferenciaRepositoryImpl(dio: Dio()) 
      )..add(LoadTransferenciaDataEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('Transfer Money')),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: BlocListener<TransferenciaBloc, TranferenciaState>(
                listener: (context, state) {
                  if (state.isValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Transferencia exitosa')),
                    );
                  } else if (!state.isValid && state.amount > 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error en la transferencia')),
                    );
                  }
                },
                child: BlocBuilder<TransferenciaBloc, TranferenciaState>(
                  builder: (context, state) {
                    TextEditingController recipientController =
                        TextEditingController(text: state.nameContacto);
                    TextEditingController amountController =
                        TextEditingController(text: state.amount.toString());
                    TextEditingController dateController =
                        TextEditingController(text: state.fechaTrans);
                    TextEditingController balanceController =
                        TextEditingController(text: state.saldoDisponible.toString());

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          'Realiza tu transferencia',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Arial Black',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF16697A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          context,
                          'Nombre del destinatario',
                          recipientController,
                          (value) => context
                              .read<TransferenciaBloc>()
                              .add(NameContactoChanged(value)),
                        ),
                        const SizedBox(height: 19),
                        _buildTextField(
                          context,
                          'Monto',
                          amountController,
                          (value) => context
                              .read<TransferenciaBloc>()
                              .add(MontoTransChanged(int.parse(value))),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 19),
                        _buildTextField(
                          context,
                          'Fecha',
                          dateController,
                          (value) => context
                              .read<TransferenciaBloc>()
                              .add(FechaTransChanged(value)),
                        ),
                        const SizedBox(height: 19),
                        _buildTextField(
                          context,
                          'Saldo Disponible',
                          balanceController,
                          (value) => context
                              .read<TransferenciaBloc>()
                              .add(SaldoDisponibleChanged(double.parse(value))),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            if (state.isValid) {
                              context
                                  .read<TransferenciaBloc>()
                                  .add(TransferenciaSubmitted());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Por favor complete todos los campos'),
                                ),
                              );
                            }
                          },
                          child: Text('Transferir'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String labelText,
      TextEditingController controller, Function(String) onChanged,
      {bool obscureText = false, TextInputType keyboardType = TextInputType.text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            labelText,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        MyTextFormField(
          controller: controller,
          hintText: 'Ingrese su $labelText',
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
