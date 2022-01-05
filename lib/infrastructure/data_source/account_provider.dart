// Dart imports:
import 'dart:convert';

import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/user_result.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';
import 'tarif_provider.dart';

// Package imports:
import 'package:http/http.dart' as http;

class AccountProvider {
  static Future<StatusDynamic?> fetchUserInfo({
    required String? token,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.user;
    var url = Uri.parse(api);

    final response = await dioAuth.dio.get(
      api,
    );
    statusDynamic.statusCode = response.statusCode;

if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      UserResult userResult = UserResult.fromJson(gelenCavabJson);
      statusDynamic.data = userResult.data;
    } else {
      eeee("fetchUserInfo bad url :$url,response: ${response}");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic?> updateUserInfo({
    required String? token,
    required String? email,
    required String? password,
    required String? password_confirmation,
    required String? birthday,
    required String? id_number,
    required String? fin,
    //required String? city,
    required int? ware_house,
    required String? address,
    required String? phone,
    required String? company_name,
    required String? tax_number,
    required String? language,
    required String? old_password,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.user;
    var url = Uri.parse(api);
    final body = ApiKeys.updateAccountBody(
        address: address,
        language: language,
        email: email,
        password: password,
        old_password: old_password,
        password_confirmation: password_confirmation,
        phone: phone,
        id_number: id_number,
        fin: fin,
        birthday: birthday,
        company_name: company_name,
        tax_number: tax_number,
        ware_house: 1);

    llll("body: " + jsonEncode(body));

    final headers = ApiKeys.header(token: token);
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    //  bbbb("huuhuhuh:"+response.body.toString() );
    // //  final response =
    // //      await dioA.dio .post(api, data: body);

    llll(api);

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.body;
    } else {
      eeee("updateAccountBody bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }
}
