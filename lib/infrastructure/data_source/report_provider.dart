// Dart imports:
import 'dart:convert';

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

  static Future<StatusDynamic?> registrationCompany({
    required String? name,
    required String? surname,
    required String? address,
    required String? email,
    required String? password,
    required String? password_confirmation,
    required String? phone,
    required int? accept,
    required String? company_name,
    required String? tax_number,
    required int? deviceTypeId,
    required String? deviceCode,
    required String? language,
  }) async {

    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.registerCompany;
    var url = Uri.parse(api);

    var body = ApiKeys.registrationBusinessBody(
        name: name,
        surname: surname,
        address: address,
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        phone: phone,
        accept: accept,
        company_name: company_name,
        tax_number: tax_number,
        deviceTypeId: deviceTypeId,
        deviceCode: deviceCode,
        language: language);


    final response =
    await http.post(url, headers: ApiKeys.headers, body: jsonEncode(body));
    // bbbb("response company register: :" + response.body);
    bbbb(" registerCompany register static body: :" + jsonEncode(body));

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      String accessToken = response.body;
      statusDynamic.data = accessToken;
      bbbb("new token: " + (statusDynamic.data).toString());
    } else {
      statusDynamic.data =
          AppOperations.errorFromListOfListAsList(response.body);
      eeee("registrationCompany bad url :$url,response: ${response}");
    }

    return statusDynamic;
  }


}
