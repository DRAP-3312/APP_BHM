import 'package:bhm_app/Core/presentation/screens/MontoServicio.dart';
import 'package:flutter/material.dart';

Widget pagoServicio(BuildContext context) {
  List<String> targets = [
    'Agua',
    'Electricidad',
    'Telefono',
    'Internet',
    'Streaming'
  ];

  List<IconData> iconos = [
    Icons.water_drop,
    Icons.bolt,
    Icons.smartphone,
    Icons.wifi,
    Icons.smart_display
  ];

  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFFC9C9C9), 
        width: 1.0, 
      ),
      borderRadius: BorderRadius.circular(6.0), 
    ),
    child: Container( 
      child: opcionesServicio(context, targets, iconos),
    ),
  );
}

Widget opcionesServicio(BuildContext context, List<String> targets, List<IconData> iconos) {
  return Column(
    children: List.generate(targets.length, (index) {
      return ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MontoServicio(servicio: "si")));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: LinearBorder.bottom(side: const BorderSide(color: Color(0xFFEFEFEF)))
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconos[index], size: 24.0, color: const Color(0xff16697A),),
              const SizedBox(width: 10),
              Text(targets[index], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w200),),
            ],
          ),
        ),
      );
    }),
  );
}
