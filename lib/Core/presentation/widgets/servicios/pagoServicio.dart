import 'package:bhm_app/Core/domain/models/servicio_model.dart';
import 'package:bhm_app/Core/presentation/screens/MontoServicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget pagoServicio(BuildContext context, List<Servicio> targets) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: const Color(0xFFC9C9C9),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: Container(
      child: targets.isNotEmpty
          ? opcionesServicio(context, targets)
          : Center(
              child: Container(
              padding: const EdgeInsets.all(30),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Icon(Icons.search_off, color: Colors.orange, size: 100,),
                  ),
                  Text(
                    'Sin servicios',
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
                  )
                ],
              ),
            )),
    ),
  );
}

Widget opcionesServicio(BuildContext context, List<Servicio> targets) {
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
                        ClipOval(
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: targets[index].icono != null &&
                                      targets[index].icono!.isNotEmpty
                                  ? Image.network(
                                      targets[index].icono!,
                                      fit: BoxFit.contain,
                                    )
                                  : Image.asset(
                                      'images/imgDefaultService.jpg',
                                      fit: BoxFit.contain,
                                    )),
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
                      Icons.arrow_forward_ios,
                      color: Color(0xFF16697A),
                    )
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
