// Package imports:
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'infrastructure/services/preferences_service.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
final ctx = _navigatorKey.currentContext;

final locator = GetIt.I;

Future<void> setupLocator() async {
  locator.registerSingleton<GlobalKey<NavigatorState>>(_navigatorKey);
  final prefs = await PreferencesService.instance;
  //   locator.registerSingleton<PreferencesService>(prefs);
  // locator.registerSingleton<FirebaseMessaging>(FirebaseMessaging.instance);
  locator.registerLazySingleton(() => prefs);
}
