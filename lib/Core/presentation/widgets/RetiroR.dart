// retiro_r.dart
import 'package:flutter/material.dart';

class RetiroR extends StatelessWidget {
   const RetiroR({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(
                Icons.check_circle_outline,
                size: 100.0,
                color: Colors.orange,
              ),
              const SizedBox(height: 24),
              const Text(
                'Retiro completado',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  // Define la acción al presionar el botón 'Listo'
                  // Por ejemplo, puedes cerrar la pantalla actual:
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Listo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
