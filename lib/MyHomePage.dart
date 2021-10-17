// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notification/notification_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // Provider.of<NotificationServices>(context).initialize();
    notificationServices.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                notificationServices.instantNotification();
              },
              child: Text("Instant Notification")),
          ElevatedButton(
              onPressed: () {
                notificationServices.imageNotification();
              },
              child: Text("Image Notification")),
          ElevatedButton(
              onPressed: () {
                notificationServices.stylishNotification();
              },
              child: Text("Media Notification")),
          ElevatedButton(
              onPressed: () {
                notificationServices.scheduledNotification();
              },
              child: Text("Scheduled Notification")),
          ElevatedButton(
              onPressed: () {
                notificationServices.cancelNotification();
              },
              child: Text("Cancel Notification")),
        ],
      ),
    ));
  }
}
