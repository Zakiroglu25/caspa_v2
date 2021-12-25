// Dart imports:
import 'dart:convert';

import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/user_result.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

class AccountProvider {
  static Future<StatusDynamic?> fetchUserInfo({
    required String? token,
  }) async {
    StatusDynamic statusDynamic =StatusDynamic();
    var api = ApiKeys.user;
    var url = Uri.parse(api);

    final headers = ApiKeys.header(token: token);
    final response = await http.get(url, headers: headers);
    llll(api);

    statusDynamic.statusCode = response.statusCode;


    if (response.statusCode == ResultKey.successCode) {

      final gelenCavabJson = jsonDecode(response.body);
      UserResult userResult = UserResult.fromJson(gelenCavabJson);

      statusDynamic.data  = userResult.data ;
      bbbb("st: "+(statusDynamic.data) .toString());

    } else {
      eeee("fetchUserInfo bad url :$url,response: ${response}");
    }

    eeee(response.body);
    return statusDynamic;
  }
}