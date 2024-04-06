import 'package:flutter/material.dart';

class ItemService extends StatelessWidget {
  final String title;
  final IconData icono;
  final VoidCallback? onTap;
  const ItemService(
      {Key? key, required this.title, required this.icono, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // Elimina el relleno interno
          minimumSize: Size.zero,
          backgroundColor:
              Colors.transparent // Establece el tamaño mínimo a cero
          ),
      child: Container(
        //padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 235, 233),
            borderRadius: BorderRadius.circular(25)),
        width: 80,
        height: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icono,
              color: const Color(0xff16697A),
              size: 50,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
