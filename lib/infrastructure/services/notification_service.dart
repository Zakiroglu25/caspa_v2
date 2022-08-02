// Package imports:

import 'dart:io';

import 'package:caspa_v2/util/delegate/foreground_notification.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final messaging = FirebaseMessaging.instance;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> onBackgroundMessage(RemoteMessage message) async {
  debugPrint('onBackgroundMessage: ${message.data}');
}

void configureFcm({String? topic, required BuildContext? context}) async {
  await initializeFCMNotification();
  if (Platform.isIOS) {
    await requestPermission();
  }

  FirebaseMessaging.instance.getInitialMessage().then((value) {
    final Map<String, dynamic>? data = value?.data;
    // GeneralOperations.determineTab(data);
  });

  FirebaseMessaging.onMessage.listen((event) {
    bbbb("sss: " + event.notification!.title.toString());
    // _showNotificationCustomSound();
    ForegroundNotification.show(event);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    final Map<String, dynamic> data = event.data;
    //GeneralOperations.determineTab(data);
  });

  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  messaging.subscribeToTopic('all');
  messaging.subscribeToTopic('1.0.0');
  messaging.subscribeToTopic('test3');
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

Future<void> _showNotificationCustomSound() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your other channel id',
    'your other channel name',
    channelDescription: 'your other channel description',
    sound: RawResourceAndroidNotificationSound('alert'),
  );
  const IOSNotificationDetails iOSPlatformChannelSpecifics =
      IOSNotificationDetails(sound: 'slow_spring_board.aiff');
  const MacOSNotificationDetails macOSPlatformChannelSpecifics =
      MacOSNotificationDetails(sound: 'slow_spring_board.aiff');
  final LinuxNotificationDetails linuxPlatformChannelSpecifics =
      LinuxNotificationDetails(
    sound: AssetsLinuxSound('sound/slow_spring_board.mp3'),
  );
  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
    macOS: macOSPlatformChannelSpecifics,
    linux: linuxPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    0,
    'custom sound notification title',
    'custom sound notification body',
    platformChannelSpecifics,
  );
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
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized ||
      settings.authorizationStatus == AuthorizationStatus.provisional) {
    return true;
  }

  return false;
}

// Future onDidReceiveLocalNotification(
//     int id, String title, String body, String payload) {}
//
// void unsubscribe({String topic}) {
//   messaging.unsubscribeFromTopic(topic);
// }
