import 'package:bhm_app/Core/data/repositories/transferencia_repositoryImpl.dart';
import 'package:bhm_app/Core/domain/usecases/load_transferencia_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_event.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_transferencia/transferencia_state.dart';
import 'package:bhm_app/Core/presentation/screens/TransferScreen.dart';
import 'package:bhm_app/service/notification.service.dart';


// void main() {
//   runApp(MaterialApp(home: PantallaTransferencia(usuario: 'EjemploUsuario')));
// }


class PantallaTransferencia extends StatefulWidget {
  final String usuario; // Parámetro requerido para la pantalla

  PantallaTransferencia({required this.usuario});

  @override
  _PantallaTransferenciaState createState() => _PantallaTransferenciaState();
}

class _PantallaTransferenciaState extends State<PantallaTransferencia> {
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    _focusNode.requestFocus();
    return BlocProvider(
      create: (context) => TransferenciaBloc(LoadTransferenciaData(TransferenciaRepositoryImpl()))..add(LoadTransferenciaDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF16697A),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TransferScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Cantidad a transferir',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Container(), // Puedes eliminar los contenedores adicionales si no son necesarios
            ],
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<TransferenciaBloc,TranferenciaState>(
            builder: (context, state) {
               TextEditingController nameController = TextEditingController(text: state.nameContacto);
              TextEditingController montoController = TextEditingController(text: state.montoTrans.toString());
              TextEditingController fechaController = TextEditingController(text: state.fechaTrans);
              TextEditingController saldoController = TextEditingController(text: state.saldoDisponible.toString());
             
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _amountController,
                      focusNode: _focusNode,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: '0',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          // actualiza el controlador con el nuevo valor
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Nombre del contacto: ${state.nameContacto}',
                      style: const TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Monto de la transacción: ${state.montoTrans}\$',
                      style: const TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fecha de la transacción: ${state.fechaTrans}',
                      style: const TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Saldo disponible',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${state.saldoDisponible}\$',
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        mostrarNotificacion(_amountController.text, widget.usuario);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Listo'),
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
