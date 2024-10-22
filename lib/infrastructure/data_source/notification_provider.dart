// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/general_response_model.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:http/http.dart' as http;

import '../../locator.dart';
import '../configs/dio_auth.dart';
import '../models/remote/response/status_dynamic.dart';
import '../models/remote/response/user_result.dart';

class NotificationProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getNotification() async {
    StatusDynamic statusDynamic = StatusDynamic();
    late List<MyNotification>? notificastionsList;
    final api = ApiKeys.user;

    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      final k = (UserResult.fromJson(gelenCavabJson)).data?.notifications;
      notificastionsList = k;
      statusDynamic.data = notificastionsList;
    } else {
      eeee("getNotification url :$api ,response: $response");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> removeNotification(
      {required int notificationId}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.deleteNotification + "?id=$notificationId";

    final response = await dioAuth.dio.post(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
    } else {
      eeee(
          "removeNotification result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<GeneralResponse?> updateNotificationHeader({
    @required String? userId,
  }) async {
    GeneralResponse? generalResponse;
    final api = ApiKeys.login;
    final headers = ApiKeys.headers;
    var url = Uri.parse(api + '/$userId');
    llll("updateNotificationHeader url: " + url.toString());
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var dataGelenCavabJSON = jsonDecode(response.body);
      generalResponse = GeneralResponse.fromJson(dataGelenCavabJSON);
    } else {
      eeee(
          "updateNotificationHeader result bad:  url: $url  ,  response: ${response.body}");
    }
    return generalResponse;
  }
}
