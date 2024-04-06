import 'package:flutter/material.dart';

Widget opcionHelp(IconData icono, String info) {
  return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(8.0),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12)),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color(0xff82C0CC);
              }
              return null;
            },
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icono,
                  size: 30,
                  color: const Color(0xffFF6347),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  info,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff16697A),
            ),
          ],
        ),
      ));
}
