import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class Recorder {
  static final crashlytics = FirebaseCrashlytics.instance;

  static void recordResponseError(Response response) async {
    await FirebaseCrashlytics.instance.recordError(
        DioErrorType.response, StackTrace.fromString(response.data.toString()),
        reason: 'Error during dio request',
        // Pass in 'fatal' argumen
        information: [
          DiagnosticsNode.message(response.requestOptions.baseUrl.toString()),
          DiagnosticsNode.message(response.requestOptions.path.toString()),
          DiagnosticsNode.message(response.requestOptions.method.toString()),
          DiagnosticsNode.message(response.requestOptions.data.toString()),
          DiagnosticsNode.message(response.statusCode.toString()),
          DiagnosticsNode.message(response.toString()),
        ],
        //information:  [...LoggingService.logHistory.map((e) => DiagnosticsNode.message(e)).toList()],
        fatal: true);
  }

  static void recordDioError(DioError error) async {
    await crashlytics.recordError(error.type, error.stackTrace,
        reason: error.error,
        // Pass in 'fatal' argumen
        information: [
          DiagnosticsNode.message(error.requestOptions.baseUrl.toString()),
          DiagnosticsNode.message(error.requestOptions.path.toString()),
          DiagnosticsNode.message(error.requestOptions.method.toString()),
          DiagnosticsNode.message(error.requestOptions.data.toString()),
          DiagnosticsNode.message(error.response.toString()),
        ],
        //information:  [...LoggingService.logHistory.map((e) => DiagnosticsNode.message(e)).toList()],
        fatal: false);
  }

  static void recordCatchError(Object e, StackTrace s) async {
    // crashlytics.setCustomKey('title', jsonEncode({'hello':"salma","qaqa":13}));
    await FirebaseCrashlytics.instance.recordError("Error cathed: ", s,
        reason: e.toString(),
        // Pass in 'fatal' argumen
        information: [DiagnosticsNode.message(s.toString())],
        //information:  [...LoggingService.logHistory.map((e) => DiagnosticsNode.message(e)).toList()],
        fatal: true);
  }

  static void recordSpecialError(String title, StackTrace s) async {
    FirebaseCrashlytics.instance
        .setCustomKey('title', {'hello': "salma", "qaqa": 12});
    await FirebaseCrashlytics.instance.recordError(
        DioErrorType.response, StackTrace.fromString("Salam qaqa"),
        reason: title.toString(),
        // Pass in 'fatal' argumen
        information: [DiagnosticsNode.message(s.toString())],
        //information:  [...LoggingService.logHistory.map((e) => DiagnosticsNode.message(e)).toList()],
        fatal: true);
  }

  static void setUser(MyUser? user) {
    if (user != null) {
      FirebaseCrashlytics.instance.setCustomKey('user', user.toString());
    }
  }

  static void setId(id) {
    if (id != null) {
      FirebaseCrashlytics.instance.setUserIdentifier(id.toString());
    }
  }

  static void setUserFCMtoken(String? fcm) {
    if (fcm != null) {
      FirebaseCrashlytics.instance.setCustomKey('fcmToken', fcm.toString());
    }
  }
}
