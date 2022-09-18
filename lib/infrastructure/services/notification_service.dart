// Package imports:

import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:caspa_v2/util/delegate/foreground_notification.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/constants/durations.dart';

final messaging = FirebaseMessaging.instance;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> onBackgroundMessage(RemoteMessage message) async {
  debugPrint('onBackgroundMessage: ${message}');
  await Future.delayed(Durations.s2);
  // showNotificationCustomSound(message);
}

void configureFcm({String? topic, required BuildContext? context}) async {
  await initializeFCMNotification();
  if (Platform.isIOS) {
    await requestPermission();
  }
  //_createNotificationChannel("0", "0");
  FirebaseMessaging.instance.getInitialMessage().then((value) {
    final Map<String, dynamic>? data = value?.data;
    //AppSettings.openNotificationSettings();
    // GeneralOperations.determineTab(data);
  });

  FirebaseMessaging.onMessage.listen((message) {
    //bbbb("sss: " + event.notification!.title.toString());
    //  showNotificationCustomSound(message);

    ForegroundNotification.show(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    final Map<String, dynamic> data = event.data;
    //GeneralOperations.determineTab(data);
  });

  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  messaging.subscribeToTopic('all');
  messaging.subscribeToTopic('1.0.0');
  messaging.subscribeToTopic('test5');
}

initializeFCMNotification() async {
  bbbb("fcm token: ${messaging.getToken()}");
  var initializationSettingsAndroid = AndroidInitializationSettings(
    '@mipmap/ic_launcher_notf',
  );
  var initializationSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,

    // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  );
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (var payload) {
    //return
    onSelectNotification(payload);
  });

  // generalSubscribtion();
}

Future<void> showNotificationCustomSound(RemoteMessage message) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your other channel id',
    'your other channel name',
    importance: Importance.min,
    priority: Priority.min,
    autoCancel: true,
    playSound: true,
    enableLights: true,
    channelDescription: 'your other channel description',
    sound: RawResourceAndroidNotificationSound('alert'),
  );
  const IOSNotificationDetails iOSPlatformChannelSpecifics =
      IOSNotificationDetails(sound: 'alert.aiff');

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    0,
    '${message.notification?.title}',
    '${message.notification?.body}',
    platformChannelSpecifics,
  );
  await Future.delayed(Durations.s4);
  await flutterLocalNotificationsPlugin.cancel(0);
}

Future onSelectNotification(var payload) async {
  if (payload != null) {
    //debugPrint('notification payload: ' + payload);
    launch(payload);
  }
}

Future<bool> requestPermission() async {
  var settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: false,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized ||
      settings.authorizationStatus == AuthorizationStatus.provisional) {
    return true;
  }

  return false;
}

Future<void> _createNotificationChannel(String id, String name) async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var androidNotificationChannel = AndroidNotificationChannel(id, name);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidNotificationChannel);
}

// Future onDidReceiveLocalNotification(
//     int id, String title, String body, String payload) {}
//
// void unsubscribe({String topic}) {
//   messaging.unsubscribeFromTopic(topic);
// }
class Helper {
  static Future<void> showNotificationCustomSound(
      {required String title, required String body}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '$title',
      '$body',
      channelDescription: 'your other channel description',
      sound: RawResourceAndroidNotificationSound('alert'),
    );
    IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'alert.aiff');

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      '',
      '',
      platformChannelSpecifics,
    );
    await Future.delayed(Durations.s4);
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
