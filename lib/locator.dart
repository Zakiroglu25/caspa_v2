// Package imports:
import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'infrastructure/configs/dio_general.dart';
import 'infrastructure/services/preferences_service.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
final ctx = _navigatorKey.currentContext;
final locator = GetIt.I;
final dio = Dio();


Future<void> setupLocator() async {
  locator.registerSingleton<GlobalKey<NavigatorState>>(_navigatorKey);
  final prefs = await PreferencesService.instance;
  final dioG = await DioG.instance;

  //   locator.registerSingleton<PreferencesService>(prefs);
  locator.registerSingleton<FirebaseMessaging>(FirebaseMessaging.instance);
  locator.registerLazySingleton(() => prefs);
  //locator.registerSingleton<DioG>(await DioG.instance);
  locator.registerLazySingleton<DioG>(()=>dioG);
  final dioA = await DioAuth.instance;
  locator.registerLazySingleton<DioAuth>(()=>dioA);


  // locator.registerLazySingleton<RegisterRepository>(() => RegisterS)
}
