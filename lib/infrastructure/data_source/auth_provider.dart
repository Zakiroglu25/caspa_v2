// Dart imports:
import 'dart:convert';

import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

class AuthProvider {
  static Future<StatusDynamic?> login({
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
      eeee("fetchUserInfo bad url :$url,response: ${response}");
    }

    // Response? response ;
    // // try {response= await DioX.client
    // //     .post(
    // //       ApiKeys.login,
    // //       data: jsonEncode(bo),
    // //     );}
    // // on DioError catch(e){
    // //   print("dddfffdsdfsfd");
    // //  // throw Exception(e.response?.data);
    // //
    // // }

    return statusDynamic;
  }

  static Future<http.Response> registrationBusiness({
    required String? name,
    required String? surname,
    required String? address,
    required String? email,
    required String? password,
    required String? password_confirmation,
    required String? phone,
    required String? accept,
    required String? company_name,
    required String? tax_number,
  }) async {
    var api = ApiKeys.register;
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
        tax_number: tax_number);

    final response =
    await http.post(url, headers: ApiKeys.headers, body: jsonEncode(body));

    // Response? response ;
    // // try {response= await DioX.client
    // //     .post(
    // //       ApiKeys.login,
    // //       data: jsonEncode(bo),
    // //     );}
    // // on DioError catch(e){
    // //   print("dddfffdsdfsfd");
    // //  // throw Exception(e.response?.data);
    // //
    // // }

    return response;
  }

  static Future<http.Response> registrationPersonal({
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
    required int? ware_house,
  }) async {
    var api = ApiKeys.register;
    var url = Uri.parse(api);

    var body = ApiKeys.registrationPersonalBody(
      name: name,
      surname: surname,
      address: address,
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      phone: phone,
      accept: accept,
      ware_house: ware_house,
      fin: fin,
      birthday: birthday,
      gender: gender,
      id_number: id_number,
    );

    final response =
    await http.post(url, headers: ApiKeys.headers, body: jsonEncode(body));

    bbbb("response personla register: :" + response.body);
    if (response.statusCode == ResultKey.responseSuccess) {
      var dataGelenCavabJSON = jsonDecode(response.body);
      //print("addComment result: $dataGelenCavabJSON");
      //addComment = AddComment.fromJson(dataGelenCavabJSON);
    } else {
      eeee("addComment result bad:  url: $url  ,  response: ${response.body}");
    }

    // Response? response ;
    // // try {response= await DioX.client
    // //     .post(
    // //       ApiKeys.login,
    // //       data: jsonEncode(bo),
    // //     );}
    // // on DioError catch(e){
    // //   print("dddfffdsdfsfd");
    // //  // throw Exception(e.response?.data);
    // //
    // // }

    return response;
  }
}