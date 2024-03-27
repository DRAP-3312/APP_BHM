import 'package:bhm_app/Core/presentation/widgets/servicios/pagoServicio.dart';
import 'package:flutter/material.dart';

Widget seguros() {
  List<String> targets = [
    'Vida',
    'Hogar',
    'Automovil',
  ];

  List<IconData> iconos = [
    Icons.monitor_heart,
    Icons.house,
    Icons.directions_car,
  ];
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFFC9C9C9),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: Wrap(
      spacing: 18.0, // Espacio horizontal entre los hijos
      runSpacing: 4.0, // Espacio vertical entre las líneas
      children: <Widget>[
        opcionesServicio(targets, iconos),
      ],
    ),
  );
}
