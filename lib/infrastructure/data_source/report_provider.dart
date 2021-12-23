// Dart imports:
import 'dart:convert';
import 'dart:io';

import 'package:caspa_v2/infrastructure/models/remote/response/error_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

class ReportProvider {
  static Future<StatusDynamic?> report({
    required String? store,
    required int? qty,
    required int? category,
    required String? tracking,
    required double? price,
    required String? currency,
    required File? invoice,
    required String? token,
    required String? note,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.report;
    var url = Uri.parse(api);
    final headers = ApiKeys.header(token: token);
    var body = ApiKeys.reportBody(
      store: store,
      qty: qty,
      category: category,
      tracking: tracking,
      price: price,
      currency: currency,
      invoice: invoice,
      note: note,
    );

    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    // bbbb("response company register: :" + response.body);
    bbbb(" report  static body: :" + jsonEncode(body));

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      String accessToken = response.body;
      statusDynamic.data = accessToken;
      bbbb("new token: " + (statusDynamic.data).toString());
    } else {
      statusDynamic.data =
          AppOperations.errorFromListOfListAsList(response.body);
      eeee("report bad url :$url,response: ${response}");
    }

    return statusDynamic;
  }
}
