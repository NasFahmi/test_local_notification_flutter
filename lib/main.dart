import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:local_notification_flutter/notification_server.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  runApp(
    const MyApp(),
  );
  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime schaduleTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  NotificationService().showNotification(
                      id: 1,
                      body: 'Test',
                      title: 'Ini Judul',
                      payLoad: 'ini payload');
                },
                child: Text('Notification'),
              ),
              TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(
                    context,
                    // currentTime: DateTime.now(),
                    // locale: LocaleType.id,
                    showTitleActions: true,
                    onChanged: (date) {
                      print('onchange = $date');
                      schaduleTime = date;
                    },
                    onConfirm: (time) {
                      print('onconfirm = $time');
                      schaduleTime = time;
                    },
                  );
                },
                child: Text('date picker'),
              ),
              ElevatedButton(
                onPressed: () {
                  print('notification scadule trigger');
                  NotificationService().scheduleNotification(
                    id: 2,
                    title: 'schadule Time $schaduleTime',
                    body: 'notification $schaduleTime',
                    scheduledNotificationDateTime: schaduleTime,
                  );
                  // NotificationServices().getCurrentLocation();
                },
                child: Text('Schadule Notification'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
