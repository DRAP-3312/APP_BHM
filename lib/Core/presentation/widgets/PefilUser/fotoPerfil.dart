import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget fotoPerfil() {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: Column(
      children: [
        const Text(
          'Mi cuenta',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            Container(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_photo_alternate,
                  size: 30,
                  color: Color(0xffFF6347),
                ))
          ],
        ),
        ClipOval(
          child: SizedBox(
            height: 170,
            width: 170,
            child: Image.asset('assets/images/personita.png'),
          ),
        ),
      ],
    ),
  );
}
