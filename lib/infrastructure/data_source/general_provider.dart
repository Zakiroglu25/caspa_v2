// Dart imports:
import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/ads_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/bonus_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/general_response_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

// Package imports:
import 'package:http/http.dart' as http;

import '../../locator.dart';
import '../configs/dio_auth.dart';
import '../services/hive_service.dart';

class GeneralProvider {
  static HiveService get _prefs => locator<HiveService>();
  static DioAuth get dioAuth => locator<DioAuth>();

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
    print(_prefs.accessToken);
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.ads;
    var url = Uri.parse(api);
    final response = await dioAuth.dio.get(api);
    // final response =
    //     await http.get(url, headers: ApiKeys.header(token: _prefs.accessToken));
    wtf(response.data.toString());

    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      AdsModel data = AdsModel.fromJson(gelenCavabJson);

      statusDynamic.data = data.data;
    } else {
      eeee("fetchCommission bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> adsIsActive(int id) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.adsIsActive;
    var body = {"ad": id};
    final response = await dioAuth.dio.post(api,data: body);
    wtf(response.statusCode.toString());
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
    } else {
      eeee("adsIsActive bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }
}
