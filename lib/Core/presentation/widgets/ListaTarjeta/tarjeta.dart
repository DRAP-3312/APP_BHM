import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget tarjeta(String imgTarjeta, String titulo, String banco, String clave) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(imgTarjeta),
              fit: BoxFit.fill,
            )),
        height: 80,
        width: 150,
        //child: Image.asset(imgTarjeta, fit: BoxFit.fill,),
      ),
      Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [descripcion(titulo, 18.0, Colors.black), descripcion(banco, 16.0, const Color.fromARGB(255, 116, 113, 113)), descripcion(clave,16.0, const Color.fromARGB(255, 116, 113, 113))],
        ),
      ),
      const Icon(
        Icons.navigate_next,
        size: 45,
        color: Color(0xFF16697A),
      )
    ],
  );
}

Widget descripcion(String info, double tamano, Color color){
  return Text(info, style:  TextStyle(
    color: color,
    fontWeight: FontWeight.w200,
    fontSize: tamano
  ),);
}
