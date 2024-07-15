import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/presentation/widgets/PefilUser/onEdit.dart';
import 'package:flutter/material.dart';

Widget infoPersonal(BuildContext context, String target, String valor) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    padding: const EdgeInsets.fromLTRB(12, 0, 2, 0),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 238, 235, 233),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          target,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        Text(
          valor,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            // Navegar a la vista de edición al presionar el botón
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditUser(
                user: Micuenta(
        name: '3024982387',
        lastname: 'Yoshua R. Moreno Arendondo',
        email: 'JoshRay@hotmail.com',
        phone: '9988112321', id: 1, rfc: '', password: '', id_bank: 1, isValid: true,
      ),
              )),
            );
          },
          icon: const Icon(Icons.edit, color: Color(0xFF16697A)),
        ),
      ],
    ),
  );
}
