import 'package:bhm_app/Core/data/repositories/transferencia_repositoryImpl.dart';
import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/domain/models/transferencia_model.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_state.dart';
import 'package:bhm_app/Core/presentation/screens/TransferScreen.dart';
import 'package:bhm_app/Core/presentation/shared/token_stg.dart';
import 'package:bhm_app/service/globalUser.dart';
import 'package:bhm_app/service/notification.service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PantallaTransferencia extends StatefulWidget {
  final Cuenta usuario;

  const PantallaTransferencia({super.key, required this.usuario});

  @override
  _PantallaTransferenciaState createState() => _PantallaTransferenciaState();
}

class _PantallaTransferenciaState extends State<PantallaTransferencia> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _conceptController = TextEditingController();
  final TextEditingController _ownerController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ownerController.text = widget.usuario.nickname.toString();
  }

  @override
  Widget build(BuildContext context) {
    final tokenStorage = TokenStorage();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),
        title: Text(
          'Transferencia a ${widget.usuario.nickname}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TransferScreen()),
            );
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => TransferenciaBloc(
          TransferenciaRepositoryImpl(Dio(), tokenStorage),
        ),
        child: BlocListener<TransferenciaBloc, TransferenciaState>(
          listener: (context, state) {
            if (state is TransferenciaLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Transferencia exitosa')),
              );
              mostrarNotificacion(
                _amountController.text,
                _ownerController.text,
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TransferScreen()),
              );
            } else if (state is TransferenciaError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
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
          const Text(
            'Cantidad a transferir',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(255, 83, 83, 83),
            ),
          ),
          const SizedBox(height: 10),
          buildAmountInputField(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Saldo Disponible: ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: Color(0xffFF6347),
                ),
              ),
              Text(
                '\$${GlobalState().getBalance().toString()}',
                style: const TextStyle(
                  color: Color(0xFF16697A),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildTextField(
            controller: _conceptController,
            label: 'Concepto a transferir',
            validator: (value) => value == null || value.isEmpty
                ? 'No puede estar vacío'
                : null,
          ),
          const SizedBox(
            height: 10,
          ),
          buildTextField(
            controller: _ownerController,
            label: 'Owner a transferir',
            validator: (value) => value == null || value.isEmpty
                ? 'No puede estar vacío'
                : null,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _submitTransfer(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF16697A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              'Pagar',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }

Widget buildAmountInputField() {
  return TextFormField(
    controller: _amountController,
    keyboardType: const TextInputType.numberWithOptions(decimal: false),
    style: const TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF16697A),
    ),
    textAlign: TextAlign.center,
    decoration: const InputDecoration(
      hintText: '0',
      border: InputBorder.none,
    ),
    validator: (value) {
      final intValue = int.tryParse(value ?? '') ?? 0;
      final balance = GlobalState().getBalance() ?? 0; 

      if (intValue <= 0) {
        return 'La cantidad debe ser mayor a cero';
      } else if (intValue > balance) {
        return 'La cantidad no puede ser mayor al saldo disponible';
      }
      return null;
    },
  );
}


  void _submitTransfer(BuildContext context) {
    final transfer = Transferencia(
      user_account: GlobalState().getCard().toString(),
      receptor_account: widget.usuario.account,
      amount: int.parse(_amountController.text),
      concept: _conceptController.text,
      owner: _ownerController.text,
    );
    BlocProvider.of<TransferenciaBloc>(context)
        .add(CreateTransferencia(transfer));
  }
}
