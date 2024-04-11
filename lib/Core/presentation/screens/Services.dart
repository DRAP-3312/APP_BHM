import 'package:bhm_app/Core/presentation/screens/HomePage.dart';
import 'package:bhm_app/Core/presentation/widgets/servicios/inversiones_ahorros.dart';
import 'package:bhm_app/Core/presentation/widgets/servicios/pagoServicio.dart';
import 'package:bhm_app/Core/presentation/widgets/servicios/seguros.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

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
                          builder: (context) => const HomePage()));
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
              'Servicios',
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
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              secciones('Pago de servicio', pagoServicio(context)),
              secciones('Seguro', seguros(context)),
              secciones('Inversiones y ahorros', inversionesAhorros(context))
            ],
          ),
        ),
      ),
    );
  }
}

Widget secciones(String title, Widget seccion) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(' $title',
          style: const TextStyle(
              color: Color(0xff78A1BB),
              fontSize: 18,
              fontWeight: FontWeight.w300)),
      const SizedBox(
        height: 5,
      ),
      seccion
    ],
  );
}
