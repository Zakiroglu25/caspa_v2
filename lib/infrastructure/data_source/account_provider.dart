// Dart imports:
import 'dart:convert';
import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/user_result.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../locator.dart';
import '../../util/constants/text.dart';
import '../../util/delegate/app_operations.dart';
import 'tarif_provider.dart';

// Package imports:
import 'package:http/http.dart' as http;

class AccountProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic?> fetchUserInfo({
    required String? token,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.user;
    final header = ApiKeys.header(token: token);

    final response =
        await dioAuth.dio.get(api, options: Options(headers: header));
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      UserResult userResult = UserResult.fromJson(gelenCavabJson);
      statusDynamic.data = userResult.data;
    } else {
      eeee("fetchUserInfo bad url :$api, response: ${response}");
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
    var api = ApiKeys.updateAccount;
    //var url = Uri.parse(api);
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

    final response = await dioAuth.dio.post(api,
        data: body, options: Options(headers: {'Accept': "application/json"}));
    statusDynamic.statusCode = response.statusCode;
    statusDynamic.data = response.data;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      statusDynamic.data = response.data['errors'][0][0];
      eeee("updateAccountBody bad url :$api, response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> report({
    File? invoice,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.updateAvatar;

    FormData? data;

    if (invoice == null) {
    } else {
      data = FormData.fromMap({
        "avatar": await MultipartFile.fromFile(
          invoice.path,
          filename: "invoice.png",
        ),
      });
    }

    // await MultipartFile.fromFile(
    //   invoice!.path,
    //   filename: "invoice.png",
    // )
    final response = await dioAuth.dio.post(api, data: data).then((response) {
      var jsonResponse = jsonDecode(response.toString());
      statusDynamic.statusCode = response.statusCode;
      bbbb("avatar st code: " + statusDynamic.statusCode.toString());
    }).catchError((error) => print(error));

    if (statusDynamic.statusCode == ResultKey.successCode) {
      // statusDynamic.data=response['message'];

    } else {
      statusDynamic.data = MyText.avatarNotAdded;
    }

    return statusDynamic;
  }
}
