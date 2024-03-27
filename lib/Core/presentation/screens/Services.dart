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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back),
            const Text('Servicios', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Container()
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // SizedBox(
                
              //   child: Image.asset('assets/images/Servicio.avif', fit: BoxFit.fill)
              // ),
              secciones('Pago de servicio', pagoServicio()),
              secciones('Seguro', seguros()),
              secciones('Inversiones y ahorros', inversionesAhorros())
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
       Text(' $title', style: const TextStyle(color: Color(0xff78A1BB), fontSize: 18, fontWeight: FontWeight.w300)),
      const SizedBox(
        height: 5,
      ),
      seccion
    ],
  );
}
