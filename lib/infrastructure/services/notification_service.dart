// Package imports:

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:caspa_v2/util/delegate/foreground_notification.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../presentation/page/notifications_page/notifications_page.dart';
import '../../util/constants/durations.dart';

final messaging = FirebaseMessaging.instance;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> onBackgroundMessage(RemoteMessage message) async {
  debugPrint('onBackgroundMessage: ${message}');

  await Future.delayed(AppDurations.s2);

  // showNotificationCustomSound(message);
}

void configureFcm({String? topic, required BuildContext? context}) async {
  var fcm = messaging.getToken();
  log(fcm.toString());
  await initializeFCMNotification();
  if (Platform.isIOS) {
    await requestPermission();
  }

  FirebaseMessaging.instance.getInitialMessage().then((value) {
    final Map<String, dynamic>? data = value?.data;
    iiii("getInitialMessage");
    iiii(data.toString());
  });

  FirebaseMessaging.onMessage.listen((message) {
    if (message.data['type'] == 'package') {
      Go.to(context!, Pager.package(back: true));
      //GeneralOperations.determineTab(data);
    } else {
      Go.to(context!, Pager.notifications);
    }
    ForegroundNotification.show(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    iiii("Bura onMessageOpenedApp");
    if (event.data['type'] == 'package') {
      Go.to(context!, Pager.package(back: true));
      //GeneralOperations.determineTab(data);
    } else {
      Go.to(context!, Pager.notifications);
    }
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
    // onSelectNotification(payload);
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
  // const IOSNotificationDetails iOSPlatformChannelSpecifics =
  //     IOSNotificationDetails(sound: 'alert.aiff');

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    // iOS: iOSPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    0,
    '${message.notification?.title}',
    '${message.notification?.body}',
    platformChannelSpecifics,
  );
  await Future.delayed(AppDurations.s4);
  await flutterLocalNotificationsPlugin.cancel(0);
}

Future onSelectNotification(var payload, BuildContext? context) async {
  if (payload != null) {
    Go.to(context!, Pager.notifications);
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
        IOSNotificationDetails(sound: 'slow_spring_board.aiff');

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
    await Future.delayed(AppDurations.s4);
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
