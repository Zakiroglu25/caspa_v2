// Package imports:
import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/util/delegate/user_operations.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'infrastructure/configs/dio_general.dart';
import 'infrastructure/services/app_members_service.dart';
import 'infrastructure/services/config_service.dart';
import 'infrastructure/services/hive_service.dart';

DioG get dioG => locator<DioG>();

final _navigatorKey = GlobalKey<NavigatorState>();
final ctx = _navigatorKey.currentContext;
final locator = GetIt.I;
final dio = Dio();

Future<void> setupLocator() async {
  try {
    locator.registerSingleton<GlobalKey<NavigatorState>>(_navigatorKey);
    final conf = await PackageInfo.fromPlatform();
    final hiveAppMember = await AppMembersService.instance;
    final hiveMain = await HiveService.instance;
    final hiveConfig = await ConfigService.instance;
    // final hiveConfig = await ConfigService.instance;
    final dioG = await DioG.instance;

    //   locator.registerSingleton<PreferencesService>(prefs);
    locator.registerSingleton<FirebaseMessaging>(FirebaseMessaging.instance);
    locator.registerLazySingleton(() => conf);
    locator.registerLazySingleton(() => hiveAppMember);
    locator.registerLazySingleton(() => hiveConfig);
    locator.registerLazySingleton(() => hiveMain);
    //locator.registerSingleton<DioG>(await DioG.instance);
    locator.registerLazySingleton<DioG>(() => dioG);
    final dioA = await DioAuth.instance;
    locator.registerFactory<DioAuth>(() => dioA);
  } catch (e, s) {
    Recorder.recordCatchError(e, s);
  }

  // locator.registerLazySingleton<RegisterRepository>(() => RegisterS)
}
