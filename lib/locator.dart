// Package imports:
import 'package:caspa_v2/infrastructure/data_source/register_repositoriy.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'infrastructure/services/preferences_service.dart';
import 'infrastructure/services/tarif/tarif_service.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
final ctx = _navigatorKey.currentContext;
final locator = GetIt.I;
final dio = Dio();


Future<void> setupLocator() async {
  locator.registerSingleton<GlobalKey<NavigatorState>>(_navigatorKey);
  final prefs = await PreferencesService.instance;
  //   locator.registerSingleton<PreferencesService>(prefs);
  // locator.registerSingleton<FirebaseMessaging>(FirebaseMessaging.instance);
  locator.registerLazySingleton(() => prefs);
  // locator.registerLazySingleton<RegisterRepository>(() => RegisterS)
 locator.registerLazySingleton(() => TarifService(dio));
}
