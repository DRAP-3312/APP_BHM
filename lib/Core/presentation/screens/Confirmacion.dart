import 'package:bhm_app/Core/presentation/screens/Services.dart';
import 'package:flutter/material.dart';

class ConfirmacionPagoServicio extends StatefulWidget {
  final String valorSaldo;

  const ConfirmacionPagoServicio({super.key, required this.valorSaldo});

  @override
  _ConfirmacionPagoServicio createState() => _ConfirmacionPagoServicio();
}

class _ConfirmacionPagoServicio extends State<ConfirmacionPagoServicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Servicio pagado con exito',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
               Text(
                '\$${widget.valorSaldo}',
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const  SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Services()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:Color.fromARGB(255, 71, 172, 255),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Confirmar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
