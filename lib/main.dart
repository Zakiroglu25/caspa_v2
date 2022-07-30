import 'dart:async';

import 'package:caspa_v2/mate_app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'infrastructure/configs/init.dart';

void main() async {
  runZonedGuarded(() async {
    await init();
    runApp(const MateApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
