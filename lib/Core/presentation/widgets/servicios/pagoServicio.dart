import 'package:flutter/material.dart';

Widget pagoServicio() {
  List<String> targets = [
    'Agua',
    'Electricidad',
    'Telefono',
    'Internet',
  ];

  List<IconData> iconos = [
    Icons.water,
    Icons.bolt,
    Icons.smartphone,
    Icons.wifi,
  
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
        child: opcionesServicio(targets, iconos),
      ),
  );
}

Widget opcionesServicio(List<String> targets, List<IconData> iconos) {
  return Column(
    children: List.generate(targets.length, (index) {
      return ElevatedButton(
        onPressed: () {
          // Define la acción al presionar aquí.
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
              Icon(iconos[index], size: 24.0, color: const Color(0xffFF6347),),
              const SizedBox(width: 10),
              Text(targets[index], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w200),),
            ],
          ),
        ),
      );
    }),
  );
}
