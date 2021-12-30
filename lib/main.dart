import 'dart:async';

import 'package:caspa_v2/infrastructure/configs/base.dart';
import 'package:caspa_v2/mate_app.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'infrastructure/configs/init.dart';

void main() async{

 // runApp(MateApp());

  // await SentryFlutter.init(
  //       (options) {
  //     options.dsn = Configs.sentryDsn;
  //     options.tracesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(MateApp()),
  // );

  runZonedGuarded(() async{
    await init();
    runApp(MateApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

