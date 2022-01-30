// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:caspa_v2/infrastructure/models/remote/response/general_response_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/requset/notification_model.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:http/http.dart' as http;

class NotificationProvider {
  static Future<NotificationModel?> fetchNotificationData(
      {String? token}) async {
    NotificationModel? notificationModel;
    final api = ApiKeys.baseUrl;
    //final headers = ApiKeys.headers;

    final headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(api);
    final response = await http.get(url, headers: headers);
    llll("fetchNotificationData url: " + url.toString());
    if (response.statusCode == ResultKey.responseSuccess) {
      var dataGelenCavabJSON = jsonDecode(response.body);
      notificationModel = NotificationModel.fromJson(dataGelenCavabJSON);
    } else {
      eeee(
          "fetchNotificationData result bad:  url: $url  ,  response: ${response.body}");
    }
    return notificationModel;
  }

  static Future<GeneralResponse?> removeNotification(
      {@required String? token, @required int? notificationId}) async {
    GeneralResponse? generalResponse;
    var api = ApiKeys.login;
    //final headers = ApiKeys.headers;
    final headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse(api);
    llll("removeNotification url: " + url.toString());
    final response = await http.post(url,
        headers: headers, body: jsonEncode({"notificationId": notificationId}));

    if (response.statusCode == ResultKey.responseSuccess) {
      var dataGelenCavabJSON = jsonDecode(response.body);
      //  print("removeNotification result: $dataGelenCavabJSON");
      generalResponse = GeneralResponse.fromJson(dataGelenCavabJSON);
    } else {
      eeee(
          "removeNotification result bad:  url: $url  ,  response: ${response.body}");
    }
    return generalResponse;
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
