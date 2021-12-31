// Dart imports:
import 'dart:convert';
import 'dart:io';

import 'package:caspa_v2/infrastructure/models/remote/response/error_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class OrderViaLinkProvider {
  static Future<StatusDynamic?> orderViaLink({
    required int? qty,
    required double? price,
    required String? link,
    required double? cargo_price,
    required String? detail,
    required String? token,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.orderViaLink;
    var url = Uri.parse(api);
    final headers = ApiKeys.header(token: token);
    var body = ApiKeys.orderViaLinkBody(
        link: link,
        price: price,
        cargo_price: cargo_price,
        detail: detail,
        qty: qty);

    
    bbbb("iiii: "+  jsonEncode(body));
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.body;
    } else {
      eeee("orderViaLink bad url :$url,response: ${response}");
    }

    return statusDynamic;
  }
}
