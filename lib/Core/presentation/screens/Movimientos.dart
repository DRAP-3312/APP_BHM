import 'package:bhm_app/Core/presentation/screens/HomePage.dart';
import 'package:flutter/material.dart';

class Movimientos extends StatelessWidget {
  const Movimientos({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Text(
              '       Hoy',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 237, 235),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  ListTile(
                      title: const Text("Retiro de efectivo: \u0024 3000", style: TextStyle(color: Color(0xff16697A), fontWeight: FontWeight.w400),),
                      subtitle: const Text('Hace 10 minutos', style: TextStyle(fontWeight: FontWeight.w200),),
                      leading: const Icon(
                        Icons.attach_money_outlined,
                        color: Color(0xffFF6347),
                      ),
                      onTap: () {},
                      trailing: const Icon(
                        Icons.arrow_drop_down,
                      )),
                  ListTile(
                      title: const Text('Transferencia: \u0024 300', style: TextStyle(color: Color(0xff16697A), fontWeight: FontWeight.w400),),
                      subtitle: const Text('Hace 20 minutos', style: TextStyle(fontWeight: FontWeight.w200),),
                      leading: const Icon(
                        Icons.credit_card,
                        color: Color(0xffFF6347),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_drop_down)),
                ],
              ),
            ),
              const SizedBox(
              height: 10,
            ),
            const Text(
              '       Ayer',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 237, 235),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  ListTile(
                      title: const Text(
                          'Pago articulo Tenmu tarjeta de credito: \u0024 150', style: TextStyle(color: Color(0xff16697A), fontWeight: FontWeight.w400),),
                      subtitle: const Text('Hace 1 dia', style: TextStyle(fontWeight: FontWeight.w200),),
                      leading: const Icon(
                        Icons.payments,
                        color: Color(0xffFF6347),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_drop_down)),
                  ListTile(
                      title: const Text('Encendido de tarjeta de credito', style: TextStyle(color: Color(0xff16697A), fontWeight: FontWeight.w400),),
                      subtitle: const Text('Hace 1 dia', style: TextStyle(fontWeight: FontWeight.w200),),
                      leading: const Icon(
                        Icons.power_settings_new,
                        color: Color(0xffFF6347),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_drop_down)),
                ],
              ),
            ),
              const SizedBox(
              height: 10,
            ),
            const Text(
              '       18/04/24',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 237, 235),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  ListTile(
                      title: const Text('Consulta de saldo', style: TextStyle(color: Color(0xff16697A), fontWeight: FontWeight.w400),),
                      subtitle: const Text('Hace 2 dias', style: TextStyle(fontWeight: FontWeight.w200),),
                      leading: const Icon(
                        Icons.search,
                        color: Color(0xffFF6347),
                      ),
                      onTap: () {},
                      trailing: const Icon(Icons.arrow_drop_down)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
