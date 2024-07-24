import 'package:bhm_app/Core/presentation/screens/Services.dart';
import 'package:flutter/material.dart';

class ConfirmacionPagoServicio extends StatefulWidget {
  final String valorSaldo;
  final String servicio;

  const ConfirmacionPagoServicio({super.key, required this.valorSaldo, required this.servicio});

  @override
  _ConfirmacionPagoServicio createState() => _ConfirmacionPagoServicio();
}

class _ConfirmacionPagoServicio extends State<ConfirmacionPagoServicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Servicio pagado con éxito',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Monto: \$${widget.valorSaldo}',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Servicio: ${widget.servicio}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Services()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff16697A),
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
