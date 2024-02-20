import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin(); // inisiasi flutter plugin

  Future<void> initNotification() async {
    // inisiasi android
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings(
            'ic_launcher'); //logo dari icon notification ini berada di android/app/src/main/res/drawable
    //inisiasi ios
    DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsDarwin,
    );
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {}

  notificationDetails() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
    );
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }
}

// setelah selesai pergi ke appdelegeate.siwft di ios/runner/
