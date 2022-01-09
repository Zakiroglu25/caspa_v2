// import 'package:firebase_core/firebase_core.dart';
import 'package:caspa_v2/infrastructure/services/interceptor_service.dart';
import 'package:caspa_v2/infrastructure/services/logging_service.dart';
import 'package:caspa_v2/infrastructure/services/notification_service.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../locator.dart';
import '../bloc_observer.dart';
import 'base.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await Firebase.initializeApp();
  await requestPermission();
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

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor:MyColors.white,
    statusBarColor: MyColors.transparent, // status bar color
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
}
