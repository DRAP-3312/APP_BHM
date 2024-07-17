import 'package:bhm_app/Core/domain/models/micuenta_model.dart';
import 'package:bhm_app/Core/presentation/widgets/PefilUser/onEdit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bhm_app/Core/presentation/bloc/bloc_miCuenta/miCuenta_bloc.dart';


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
            final state = BlocProvider.of<MiCuentaBloc>(context).state;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditUser(
                user: Micuenta(
                  id: state.id,
                  name: state.name,
                  lastname: state.lastname,
                  email: state.email,
                  phone: state.phone,
                  rfc: state.rfc,
                  password: '', // Assuming password is not displayed and edited
                  id_bank: state.id_bank,
                  //isValid: state.isValid,
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
