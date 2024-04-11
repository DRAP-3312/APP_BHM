import 'package:bhm_app/Core/presentation/screens/LoginPage.dart';
import 'package:bhm_app/service/notification.service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Aquí se oculta la etiqueta DEBUG
      home: Btn(),
    );
  }
}

class Btn extends StatelessWidget {
  const Btn({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: const LoginPage(),
        ),
      ),
    );
  }
}
