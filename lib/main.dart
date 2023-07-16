import 'dart:async';

import 'package:caspa_v2/infrastructure/services/notification_service.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

import 'infrastructure/configs/init.dart';
import 'mate_app.dart';
import 'util/delegate/navigate_utils.dart';

Future<dynamic> onBackgroundMessageHandler(Map<String, dynamic> message,BuildContext context) async {
  if (message['data']['type'] == 'package') {
    Go.to(context, Pager.package(back: true));
    //GeneralOperations.determineTab(data);
  } else {
    Go.to(context, Pager.notifications);
  }
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

  runZonedGuarded(() async {
    await init();
    runApp(const MateApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
