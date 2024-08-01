import 'package:bhm_app/Core/data/repositories/transferencia_repositoryImpl.dart';
import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_state.dart';
import 'package:bhm_app/Core/presentation/screens/TransferScreen.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:bhm_app/service/globalUser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PantallaTransferencia extends StatefulWidget {
  final Cuenta usuario;

  PantallaTransferencia({required this.usuario});

  @override
  _PantallaTransferenciaState createState() => _PantallaTransferenciaState();
}

class _PantallaTransferenciaState extends State<PantallaTransferencia> {
  //final TextEditingController _userAccountController = TextEditingController();
  final TextEditingController _receiverAccountController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Global key for form

  @override
  Widget build(BuildContext context) {
    final tokenStorage = TokenStorage();
    _focusNode.requestFocus();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),
        title: const Text('Cantidad a transferir',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            TransferenciaBloc(TransferenciaRepositoryImpl(Dio(), tokenStorage)),
        child: BlocListener<TransferenciaBloc, TransferenciaState>(
          listener: (context, state) {
            if (state is TransferenciaLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Transferencia exitosa')));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TransferScreen()));
            } else if (state is TransferenciaError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.message}')));
            }
          },
          child: BlocBuilder<TransferenciaBloc, TransferenciaState>(
            builder: (context, state) {
              if (state is TransferenciaLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Form(key: _formKey, child: buildForm(context));
            },
          ),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //buildTextField(controller: _userAccountController, label: 'Cuenta del usuario', validator: (value) => value == null || value.isEmpty ? 'Cuenta usuario no puede estar vacía' : null),
          const SizedBox(height: 8),
          buildTextField(
              controller: _receiverAccountController,
              label: 'Cuenta del receptor',
              validator: (value) => value == null || value.isEmpty
                  ? 'Cuenta receptor no puede estar vacía'
                  : null),
          const SizedBox(height: 16),
          buildTextField(
              controller: _amountController,
              label: 'Cantidad a transferir',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'No puede estar vacio';
                }
                if ((int.tryParse(value.toString())) == null) {
                  return 'Debe ser numero';
                }
                return null;
              },
              isAmount: true),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Validate form
                _submitTransfer(context);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16)),
            child: const Text('Pagar'),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
      {required TextEditingController controller,
      required String label,
      required String? Function(String?) validator,
      bool isAmount = false}) {
    return TextFormField(
      controller: controller,
      focusNode: isAmount ? _focusNode : null,
      keyboardType: isAmount
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
      decoration: InputDecoration(labelText: label),
      validator: validator,
    );
  }

  void _submitTransfer(BuildContext context) {
    final transfer = Transferencia(
      user_account: GlobalState().getCard().toString(),
      receptor_account: _receiverAccountController.text,
      amount: int.parse(_amountController.text),
    );
    BlocProvider.of<TransferenciaBloc>(context)
        .add(CreateTransferencia(transfer));
  }
}
