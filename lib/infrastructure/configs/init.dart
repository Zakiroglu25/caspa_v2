// import 'package:firebase_core/firebase_core.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:caspa_v2/infrastructure/services/interceptor_service.dart';
import 'package:caspa_v2/infrastructure/services/notification_service.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../locator.dart';
import 'base.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await Firebase.initializeApp();
  await requestPermission();
  await Hive.initFlutter();
  await setupLocator();

  // FirebaseCrashlytics.instance.crash();
  //FirebaseCrashlytics.instance.crash();

  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  if (Configs.enableLogging) {
    //LoggingService(Configs.enableLogging);
    //Bloc.observer = AppBlocObserver();
    dio.interceptors.add(LogInterceptorService());
  }

//  print("--------------------------------------------------");

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: MyColors.white,
    statusBarColor: MyColors.transparent, // status bar color
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );

  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      'resource://drawable/circle_icon',
      [
        NotificationChannel(
            channelGroupKey: 'sound_tests',
            //icon: 'resource://drawable/res_power_ranger_thunder',
            channelKey: "custom_sound",
            channelName: "Custom sound notifications",
            channelDescription: "Notifications with custom sound",
            playSound: true,
            soundSource: 'resource://raw/alert',
            defaultColor: Colors.red,
            ledColor: Colors.red,
            vibrationPattern: lowVibrationPattern),
      ]);

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // Insert here your friendly dialog box before call the request method
      // This is very important to not harm the user experience
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}
