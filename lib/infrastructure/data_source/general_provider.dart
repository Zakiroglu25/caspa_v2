// Dart imports:
import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/ads_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/bonus_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/commission_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/general_response_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

import '../../locator.dart';
import '../configs/dio_auth.dart';
import '../models/remote/response/wheel_response.dart';

class GeneralProvider {
  static Future<StatusDynamic?> fetchShops() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.shop;
    var url = Uri.parse(api);

    final response = await http.get(url, headers: ApiKeys.headers);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = jsonDecode(response.body);
      ShopList userResult = ShopList.fromJson(gelenCavabJson);
      statusDynamic.data = userResult.data;
      bbbb("shop list: " + (statusDynamic.data).toString());
    } else {
      eeee("fetchShops bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> fetchCommission() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.commission;
    var url = Uri.parse(api);

    final response = await http.get(url, headers: ApiKeys.headers);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = jsonDecode(response.body);
      GeneralResponse data = GeneralResponse.fromJson(gelenCavabJson);
      statusDynamic.data = data.data;
    } else {
      eeee("fetchCommission bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> ads() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.ads;
    var url = Uri.parse(api);
    final response = await http.get(url, headers: ApiKeys.headers);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = jsonDecode(response.body);
      AdsModel data = AdsModel.fromJson(gelenCavabJson);

      statusDynamic.data = data.data;
    } else {
      eeee("fetchCommission bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> bonus(
    String? token,
  ) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.bonus;
    var url = Uri.parse(api);

    log(url.toString());
    final response = await dioAuth.dio.get(api);
    log(response.data.toString());
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      log("gelenCavabJson"+gelenCavabJson.toString());
      Bonus data = Bonus.fromJson(gelenCavabJson);
      statusDynamic.data = data.data;
      log("statusDynamic"+statusDynamic.data.toString());
    } else {
      eeee("fetchBonus bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }

    static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic?> wheel(
      ) async {
    wtf("Provider1");
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.wheel;
    wtf("Provider2"+api);
    try{
      final response = await dioAuth.dio.post(api);
      log(response.statusMessage.toString());
      statusDynamic.statusCode = response.statusCode;
      if (response.statusCode == ResultKey.successCode) {
        final gelenCavabJson = response.data;

        Wheel wheel = Wheel.fromJson(gelenCavabJson);
        statusDynamic.data = wheel.message;
        wtf("Provider6");
      } else {
        eeee("fetchWheel bad url :$api,response: ${response}");
        wtf("Provider7 Error");
      }
    }catch(e){
      wtf("Provider8 Errot$e");

    }

    return statusDynamic;
  }
}
