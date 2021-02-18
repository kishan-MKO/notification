import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notifications",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.red,
        primaryColor: Colors.red,
      ),
      home: NotificationApp(),
    );
  }
}

class NotificationApp extends StatefulWidget {
  @override
  _NotificationAppState createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  FlutterLocalNotificationsPlugin localNotification;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInitialise = new AndroidInitializationSettings('ic_stat_name');
    var iOSInitialise = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialise, iOS: iOSInitialise);

    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

  Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "channelId", "Local Notification", "testing",
        importance: Importance.high);

    var iOSdetails = new IOSNotificationDetails();
    var generalNotifDetails =
        new NotificationDetails(android: androidDetails, iOS: iOSdetails);
    await localNotification.show(0, "notif", "Testing", generalNotifDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Click the button'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.notifications),
        onPressed: () {
          showNotification();
        },
      ),
    );
  }
}
