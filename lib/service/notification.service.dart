import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();

Future<void> initNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid= AndroidInitializationSettings('logo_banco');
  const DarwinInitializationSettings initializationSettingsIOS= DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}


Future<void> mostrarNotificacion(String cantidad, String usuario) async{
  const AndroidNotificationDetails androidNotificationDetails= AndroidNotificationDetails('BHM', 'Transacciones', importance: Importance.max, priority: Priority.high);
  
  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(1, 'Transferencia exitosa', 'Has realizado una transferencia de \$$cantidad para $usuario', notificationDetails);
}

