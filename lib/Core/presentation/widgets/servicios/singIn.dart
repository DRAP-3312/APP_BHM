import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Function()? onTap;

  const SignIn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xFF16697A),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Registrarse',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
