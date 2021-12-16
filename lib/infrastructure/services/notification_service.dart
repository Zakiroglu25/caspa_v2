// Package imports:

import 'dart:io';

import 'package:caspa_v2/util/delegate/foreground_notification.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:url_launcher/url_launcher.dart';

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

    bbbb("sss: "+event.notification!.title.toString());
    ForegroundNotification.show(event);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    final Map<String, dynamic> data = event.data;
    //GeneralOperations.determineTab(data);
  });

  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  messaging.subscribeToTopic('all');
  messaging.subscribeToTopic('test8');
}

initializeFCMNotification() async {
  var initializationSettingsAndroid =
      AndroidInitializationSettings('circle_icon');
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
    return onSelectNotification(payload);
  });

  // generalSubscribtion();
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
