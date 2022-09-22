// Dart imports:
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';
import '../configs/dio_auth.dart';
import '../models/remote/response/bonus_model.dart';
import '../models/remote/response/wheel_response.dart';

class WheelProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic?> fetch() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.wheel;
    try {
      final response = await dioAuth.dio.post(api);
      statusDynamic.statusCode = response.statusCode;
      if (response.statusCode == ResultKey.successCode) {
        final gelenCavabJson = response.data;
        Wheel wheel = Wheel.fromJson(gelenCavabJson);
        statusDynamic.data = wheel.message;
      } else {
        eeee("fetchWheel bad url :$api,response: ${response}");
      }
    } catch (e) {
      wtf("Provider8 Errot$e");
    }

    return statusDynamic;
  }

  static Future<StatusDynamic?> bonus(
    String? token,
  ) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.bonus;
    var url = Uri.parse(api);
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      Bonus data = Bonus.fromJson(gelenCavabJson);
      statusDynamic.data = data.data;
    } else {
      eeee("fetchBonus bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }
}
