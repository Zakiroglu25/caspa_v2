import 'dart:async';
import 'dart:io';

import 'package:caspa_v2/infrastructure/services/notification_service.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

import 'infrastructure/configs/init.dart';
import 'mate_app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<dynamic> onBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message['data'] != null) {
    final data = message['data'];
    final title = data['title'];
    final body = data['message'];
    Helper.showNotificationCustomSound(title: title, body: body);
  }

  return Future<void>.value();
}

void main() async {
  // for (int i = 0; i < 10; i++) {
  //   if (i.isEven) {
  //     Future.microtask(() => print("$i"));
  //   } else {
  //     Future.delayed(Duration(milliseconds: 1)).whenComplete(() => print("$i"));
  //   }
  // }
  HttpOverrides.global = MyHttpOverrides();
  runZonedGuarded(() async {
    await init();
    runApp(const MateApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
