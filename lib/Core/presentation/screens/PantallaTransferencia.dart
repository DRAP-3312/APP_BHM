import 'package:bhm_app/Core/presentation/screens/TransferScreen.dart';
import 'package:bhm_app/service/notification.service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: PantallaTransferencia()));
}

class PantallaTransferencia extends StatefulWidget {
  @override
  _PantallaTransferenciaState createState() => _PantallaTransferenciaState();
}

class _PantallaTransferenciaState extends State<PantallaTransferencia> {
  String cantidad = '0';
  String saldoDisponible = '10.000\$';
  final TextEditingController _amountController = TextEditingController();
  String _textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          builder: (context) => TransferScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            Container(),
            const Text(
              'Cantidad a transferir',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style:
                  const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: '0',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  _textFieldValue =
                      value; // Actualizar la variable con el nuevo valor
                });
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Saldo disponible',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              saldoDisponible,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                mostrarNotificacion(_textFieldValue);
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
      ),
    );
  }
}
