import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:bhm_app/Core/presentation/screens/MontoServicio.dart';
import 'package:flutter/material.dart';

Widget pagoServicio(
    BuildContext context, List<Servicio> targets, List<IconData> iconos) {
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

Widget opcionesServicio(
    BuildContext context, List<Servicio> targets, List<IconData> iconos) {
  return ListView(
    children: List.generate(targets.length, (index) {
      return Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MontoServicio(servicio: targets[index])),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              shape: LinearBorder.bottom(
                  side: const BorderSide(color: Color(0xFFEFEFEF))),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Icon(
                          iconos[index],
                          size: 28.0,
                          color: const Color(0xff16697A),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          targets[index].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w100,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_right,
                      size: 20.0,
                      color: Color(0xff16697A),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10), // Espacio adicional entre elementos
        ],
      );
    }),
  );
}
