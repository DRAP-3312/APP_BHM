import 'package:bhm_app/Core/presentation/widgets/PefilUser/fotoPerfil.dart';
import 'package:bhm_app/Core/presentation/widgets/PefilUser/infoPersonal.dart';
import 'package:flutter/material.dart';

Widget perfil(BuildContext context){
  return ListView(
    children: [
      fotoPerfil(),
     Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: const Text('Informacion Personal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
     ),
     Column(
      children: [
        infoPersonal(context,'Numero de cuenta','3024982387'),
        infoPersonal(context,'Usuario','tu cola R. Moreno Arendondo'),
        infoPersonal(context,'Email','JoshRay@hotmail.com'),
        infoPersonal(context,'Telefono','9988112321')
      ],
     ) 
    ],
  );
}
