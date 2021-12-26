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

class ReportProvider {
  static Future<StatusDynamic?> report({
    required String? seller,
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

    FormData? data;
    data = FormData.fromMap({
      "invoice": await MultipartFile.fromFile(
        invoice!.path,
        filename: "invoice.png",
      ),
      "store": seller,
      "qty": qty,
      "category": category,
      "tracking": tracking,
      "price": price,
      "currency": currency,
      "note": note
    });

    ;

    Dio dio = new Dio(BaseOptions(headers: headers));
    final response = await dio.post(api, data: data).then((response) {
      var jsonResponse = jsonDecode(response.toString());
      statusDynamic.statusCode = response.statusCode;
      bbbb("oio: " + statusDynamic.statusCode.toString());
    }).catchError((error) => print(error));

    if (statusDynamic.statusCode == ResultKey.successCode) {
      // statusDynamic.data=response['message'];

    } else {
      statusDynamic.data=MyText.reportIsNotAdded;
    }

    return statusDynamic;
  }
}
