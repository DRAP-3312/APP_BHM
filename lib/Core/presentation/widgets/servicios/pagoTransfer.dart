import 'package:bhm_app/Core/domain/models/cuenta_model.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_contacto/contacto_event.dart';
import 'package:bhm_app/Core/presentation/screens/PantallaTransferencia.dart';
import 'package:flutter/material.dart';

Widget pagoTransfer(
    BuildContext context, List<Cuenta> targets, ContactoBloc contactoBloc) {
  return Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFC9C9C9),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: targets.isNotEmpty
          ? opcionesContacto(context, targets, contactoBloc)
          : Center(
              child: Container(
              padding: const EdgeInsets.all(30),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Icon(
                      Icons.search_off,
                      color: Colors.orange,
                      size: 100,
                    ),
                  ),
                  Text(
                    'Sin Contactos',
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
                  )
                ],
              ),
            )),
    ),
  );
}

Widget opcionesContacto(
    BuildContext context, List<Cuenta> targets, ContactoBloc contactoBloc) {
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
                        PantallaTransferencia(usuario: targets[index])),
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
                        const Icon(
                          Icons.face,
                          size: 28.0,
                          color: Color(0xff16697A),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              targets[index].nickname.trim(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Account: ${targets[index].account.trim()}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Banco: ${targets[index].bankname.isNotEmpty ? targets[index].bankname.trim() : 'vacio'}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              backgroundColor: Colors.white,
                              title: const Text('Confirmar Eliminación', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xff16697A)),),
                              content: const Text(
                                '¿Realmente desea eliminar este Contacto?',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Cierra el diálogo
                                  },
                                  child: const Text(
                                    'Cancelar',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500,color: Color(0xffFF6347)),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    contactoBloc.add(
                                        DeleteContactoEvent(targets[index].id));
                                    Navigator.of(context)
                                        .pop(); // Cierra el diálogo
                                  },
                                  child: const Text('Confirmar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500, color: Color(0xffFF6347))),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    }),
  );
}
