// Package imports:

import 'dart:convert';
import 'dart:io';

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
    print("notifiaction");

    // GeneralOperations.determineTab(data);
  });

  FirebaseMessaging.onMessage.listen((message) {
    //bbbb("sss: " + event.notification!.title.toString());
    //  showNotificationCustomSound(message);
    final type = message.data["data"];
    print(type);
    if (type != null && type == 'report') {
      print("bu odur");
    } else {
      print("1");
      print("================");
      print(message.toString());
      print(message.data.toString());
      print("================");
    }
    print("notifiaction" + type);
    print("2");
    print("================");
    print(message.toString());
    print(message.data.toString());
    print("================");

    ForegroundNotification.show(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    // {
    //   "id": 30343,
    // "title": "Bağlamanız Xarici anbardadır",
    // "description": "A459378 kodlu bağlamanız Xarici anbardadır",
    // "created_at": "2022-04-15 00:41:40",
    // "updated_at": "2022-04-15 00:41:40",
    // "read": 0,
    // "data": {
    // "type": "package",
    // "id": 25654
    // }
    // },
    print("notifiaction"+event.toString());
    print("3");
    print("================");
    print(event.toString());
    iiii(event.notification.toString());
    dddd(event.notification!.body.toString());
    bbbb(event.data.toString());
    wtf(event.notification.toString());
    llll(event.notification!.body.toString());
    print(event.notification!.body);

    // final type = jsonDecode(event.notification!.body!)['data']['type'];
    // if (type == 'package') {
    //   iiii("package dir");
    // } else {
    //   wtf("package deyil");
    // }
    // if (type == 'report') {
    //   iiii("report dir");
    // } else {
    //   wtf("package deyil");
    // }



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
