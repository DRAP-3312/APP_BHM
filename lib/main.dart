import 'package:bhm_app/Core/presentation/screens/LoginPage.dart';
import 'package:flutter/material.dart';


void main(){runApp(const MyApp());}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Btn(),
    );
  }
}

class Btn extends StatelessWidget {
  const Btn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
      ),
      body:   Center(child:  SizedBox( width: MediaQuery.of(context).size.width * 0.8, child: const LoginPage()))
    );
  }
}