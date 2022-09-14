import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

import 'infrastructure/configs/init.dart';
import 'mate_app.dart';

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
