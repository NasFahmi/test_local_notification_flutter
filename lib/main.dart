import 'package:flutter/material.dart';
import 'package:local_notification_flutter/notification_server.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices().initNotification();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                NotificationServices().showNotification(
                  id: 1,
                  body: 'Test',
                  title: 'Ini Judul',
                  payload: 'Test Payload',
                );
              },
              child: Text('Notification'),
            ),
          ),
        ),
      ),
    );
  }
}
