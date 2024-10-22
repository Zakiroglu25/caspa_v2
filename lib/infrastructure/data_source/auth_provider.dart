// Dart imports:
import 'dart:convert';

import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

// Package imports:
import 'package:http/http.dart' as http;

import '../../locator.dart';

class AuthProvider {
  static Future<StatusDynamic> login({
    required String? password,
    required String? email,
    required String? deviceCode,
    required String? deviceName,
    required int? deviceTypeId,
    required String? lang,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.login;
    var url = Uri.parse(api);

    var body = ApiKeys.loginBody(
      password: password,
      email: email,
      device_name: deviceName,
      language: lang,
      deviceTypeId: deviceTypeId,
      deviceCode: deviceCode,
    );

    final response =
        await http.post(url, headers: ApiKeys.headers, body: jsonEncode(body));

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      String accessToken = response.body;
      statusDynamic.data = accessToken;
      bbbb("new token: " + (statusDynamic.data).toString());
    } else {
      statusDynamic.data =
          AppOperations.errorFromListOfListAsList2(response.body);
      eeee("login bad url :$url, response: ${response}");
    }

    return statusDynamic;
  }

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
      language: language,
    );

    // final response =
    //     await http.post(url, headers: ApiKeys.headers, body: jsonEncode(body));
    final response = await dioG.dio.post(api, data: body);

    // bbbb("response company register: :" + response.body);
    bbbb(" registerCompany register static body: :" + jsonEncode(body));

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      String accessToken = response.data;
      statusDynamic.data = accessToken;
      bbbb("new token: " + (statusDynamic.data).toString());
    } else {
      // statusDynamic.data =
      //     AppOperations.errorFromListOfListAsList(response.data);
      eeee("registrationCompany bad url :$url,response: ${response}");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic?> registrationPersonal({
    required String? name,
    required String? surname,
    required String? address,
    required String? email,
    required String? password,
    required String? password_confirmation,
    required String? phone,
    required int? accept,
    required String? id_number,
    required String? fin,
    required String? birthday,
    required String? gender,
    required int? branch,
    required int? deviceTypeId,
    required String? deviceCode,
    required String? language,
    required String? ext,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.registerPersonal;
    var url = Uri.parse(api);

    var body = ApiKeys.registrationPersonalBody(
        name: name,
        surname: surname,
        address: address,
        email: email,
        password: password,
        password_confirmation: password,
        phone: phone,
        accept: accept,
        branch: branch,
        fin: fin,
        birthday: birthday,
        gender: gender,
        id_number: id_number,
        deviceCode: deviceCode,
        deviceTypeId: deviceTypeId,
        ext: ext,
        language: language);

    final response =
        await http.post(url, headers: ApiKeys.headers, body: jsonEncode(body));
    //final response = await dioG.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      String accessToken = response.body;
      statusDynamic.data = accessToken;
      bbbb("new token: " + (statusDynamic.data).toString());
    } else {
      statusDynamic.data =
          //response.body;
          AppOperations.errorFromListOfListAsList(response.body);
      eeee("registrationPersonal bad url :$api,response: ${response}");
    }

    return statusDynamic;
  }
}
