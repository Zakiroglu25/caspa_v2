// // Package imports:
// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// final messaging = FirebaseMessaging.instance;
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// Future<void> onBackgroundMessage(RemoteMessage message) async {
//   debugPrint('onBackgroundMessage: ${message.data}');
//   // setSentry(message.notification);
//
//   //await _firebaseMessaging.sendMessage();
// }
//
// void configureFcm({String topic, @required BuildContext context}) async {
//   await initializeFCMNotification();
//   if (Platform.isIOS) {
//     await requestPermission();
//   }
//   FirebaseMessaging.onMessage.listen((event) {
//     //debugPrint('onMessage: ------');
//     //NotificationHandler.showBigTextNotification(message: event);
//     // NotificationHandler.showNotification(event);
//     // NavigateUtils.pushNewRoot(
//     //     context,
//     //     BlocProvider(
//     //       create: (context) =>
//     //           TransactionCubit()..fetch(loading: true, context: context),
//     //       child: TransactionPage(),
//     //     ));
//     // s.SchedulerBinding.instance.addPostFrameCallback((_) {
//     //   Navigator.of(locator<GlobalKey<NavigatorState>>().currentContext).push(
//     //     MaterialPageRoute(
//     //         builder: (context) => Pager.transactions(showBackButton: true)),
//     //   );
//     // });
//     // Navigator.push(
//     //     context, MaterialPageRoute(builder: (context) => SettingsPage()));
//
//     //Snack.display(context: context, message: "ftyhgh");
//     //setSentry(event.notification);
//     debugPrint('onMessage: ${event.notification.title}');
//   });
//
//   FirebaseMessaging.onMessageOpenedApp.listen((event) {});
//
//   FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
//   messaging.subscribeToTopic('all');
//   messaging.subscribeToTopic('test');
// }
//
// initializeFCMNotification() async {
//   var initializationSettingsAndroid =
//       AndroidInitializationSettings('circle_icon');
//   var initializationSettingsIOS = IOSInitializationSettings(
//     requestSoundPermission: true,
//     requestBadgePermission: true,
//     requestAlertPermission: true,
//     onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//   );
//   var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (var payload) {
//     return onSelectNotification(payload);
//   });
//
//   // generalSubscribtion();
// }
//
// Future onSelectNotification(var payload) async {
//   if (payload != null) {
//     //debugPrint('notification payload: ' + payload);
//     launch(payload);
//   }
// }
//
// Future<bool> requestPermission() async {
//   var settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: true,
//     sound: true,
//   );
//
//   if (settings.authorizationStatus == AuthorizationStatus.authorized ||
//       settings.authorizationStatus == AuthorizationStatus.provisional) {
//     return true;
//   }
//
//   return false;
// }
//
// Future onDidReceiveLocalNotification(
//     int id, String title, String body, String payload) {}
//
// void unsubscribe({String topic}) {
//   messaging.unsubscribeFromTopic(topic);
// }
//
// PreferencesService get _prefs => locator<PreferencesService>();
//
// void setSentry(
//   RemoteNotification notification,
// ) async {
//   getException(await Sentry.captureException({
//     "user": _prefs.user,
//     "body": notification.body,
//     "title": notification.title,
//     "date": DateTime.now().toString()
//   }, stackTrace: "stackTrace", hint: "notification")
//       .then((value) {
//     debugPrint("error sended: $value");
//   }));
// }
//
// class NotificationHandler {
//   FirebaseMessaging _fcm = FirebaseMessaging.instance;
//   BuildContext myContext;
//   Directory directory;
//   static final NotificationHandler _singleton = NotificationHandler._internal();
//
//   factory NotificationHandler() {
//     return _singleton;
//   }
//
//   NotificationHandler._internal();
//
//   initializeFCMNotification(BuildContext context) async {
//     myContext = context;
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     var initializationSettingsIOS = IOSInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (var payload) {
//       onSelectNotification(payload);
//     });
//
//     // generalSubscribtion();
//   }
//
//   static Future<void> showNotification(RemoteMessage message) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails('your channesaakvl id', 'your channel name',
//             'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             // icon: 'assets/png/phone_temp.png',
//             ticker: 'ticker');
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//         0, '${DateTime.now()}', 'plain body', platformChannelSpecifics,
//         payload: 'item x');
//   }
// }
