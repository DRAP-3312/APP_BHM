import 'package:bhm_app/Core/presentation/screens/LoginPage.dart';
import 'package:bhm_app/service/globalUser.dart';
import 'package:bhm_app/service/notification.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initNotification();
  runApp(
    ChangeNotifierProvider(
      create: (context) => GlobalState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Aquí se oculta la etiqueta DEBUG
      home: LoginPage(),
    );
  }
}
