
import 'package:bhm_app/Core/presentation/screens/HomePage.dart';
import 'package:flutter/material.dart';

class Movimientos extends StatelessWidget {
@override
 Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16697A),
        title: const Text(
          'Movimientos recientes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        leading: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
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
      ),
      body: Column(
        children: <Widget>[
          ListTile(
          title: Text("Retiro de efectivo: \u0024 3000"),
          subtitle: Text('Hace 10 minutos'),
          leading: Icon(Icons.attach_money_outlined),
          onTap: () {
          },
           trailing: Icon(Icons.arrow_drop_down)
        ),
        ListTile(
          title: Text('Transferencia: \u0024 300'),
          subtitle: Text('Hace 20 minutos'),
          leading: Icon(Icons.credit_card),
          onTap: () {

          },
          trailing: Icon(Icons.arrow_drop_down)
        ),
        ListTile(
          title: Text('Pago articulo Tenmu tarjeta de credito: \u0024 150'),
          subtitle: Text('Hace 1 dia'),
          leading: Icon(Icons.payments),
          onTap: () {
          },
          trailing: Icon(Icons.arrow_drop_down)
        ),
        ListTile(
          title: Text('Encendido de tarjeta de credito'),
          subtitle: Text('Hace 1 dia'),
          leading: Icon(Icons.power_settings_new),
          onTap: () {

          },
          trailing:Icon(Icons.arrow_drop_down)
        ),
        ListTile(
          title: Text('Consulta de saldo'),
          subtitle: Text('Hace 2 dias'),
          leading: Icon(Icons.search),
          onTap: () {

          },
          trailing: Icon(Icons.arrow_drop_down)
        ),
        ],
      ),
    ),
  );
  }
}