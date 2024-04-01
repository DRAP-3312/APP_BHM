import 'package:bhm_app/Core/presentation/widgets/PefilUser/fotoPerfil.dart';
import 'package:bhm_app/Core/presentation/widgets/PefilUser/infoPersonal.dart';
import 'package:flutter/material.dart';

Widget perfil(){
  return ListView(
    children: [
      fotoPerfil(),
     Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: const Text('Informacion Personal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
     ),
     Column(
      children: [
        infoPersonal('Numero de cuenta','3024982387'),
        infoPersonal('Usuario','Yoshua R. Moreno Arendondo'),
        infoPersonal('Email','JoshRay@hotmail.com'),
        infoPersonal('Telefono','9988112321')
      ],
     ) 
    ],
  );
}
