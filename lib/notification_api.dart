// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");
    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // notifyListeners();
  }

  // Instant Notofications
  Future instantNotification() async {
    var android = AndroidNotificationDetails(
      'id',
      'channel', // description or body deprecated
    );
    var iOS = IOSNotificationDetails();

    var platform = NotificationDetails(
      android: android,
      iOS: iOS,
    );

    await _flutterLocalNotificationsPlugin.show(
        0, 'Demo instant notification', 'Tap to do something', platform,
        payload: 'Welcome to demo app');
    // notifyListeners();
  }

  // Image Notification
  Future imageNotification() async {
    var bigPicture = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap('ic_launcher'),
        largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
        contentTitle: 'Demo image notification',
        summaryText: 'This is some text',
        htmlFormatContent: true,
        htmlFormatContentTitle: true);
    var android = AndroidNotificationDetails('id', 'channel',
        styleInformation: bigPicture);

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(
        0, 'Demo Image notification', 'Tap to do something', platform,
        payload: 'Welcome to demo app');
    // notifyListeners();
  }

  // Stylish Notifications
  Future stylishNotification() async {
    var android = AndroidNotificationDetails(
      'id',
      'channel',
      color: Colors.deepOrange,
      enableLights: true,
      enableVibration: true,
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
      styleInformation:
          MediaStyleInformation(htmlFormatContent: true, htmlFormatTitle: true),
    );

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.show(
        0, 'Demo Stylish notification', 'Tap to do something', platform);
    // notifyListeners();
  }

  //Scheduled Notification
  Future scheduledNotification() async {
    var interval = RepeatInterval.everyMinute;

    var bigPicture = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap('ic_launcher'),
        largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
        contentTitle: 'Demo image notification',
        summaryText: 'This is some text',
        htmlFormatContent: true,
        htmlFormatContentTitle: true);
    var android = AndroidNotificationDetails('id', 'channel',
        styleInformation: bigPicture);

    var platform = NotificationDetails(android: android);

    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'Demo Scheduled notification',
        'Tap to do something',
        interval,
        platform,
        payload: 'Welcome to demo app');
    // notifyListeners();
  }

  //Scheduled Notification
  Future cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
    // notifyListeners();
  }
}
