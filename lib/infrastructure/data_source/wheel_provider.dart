// Dart imports:
import 'dart:developer';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';
import '../configs/dio_auth.dart';
import '../models/remote/response/wheel_response.dart';

class WheelProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic?> fetch() async {
    wtf("Provider1");
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.wheel;
    wtf("Provider2" + api);
    try {
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
    } catch (e) {
      wtf("Provider8 Errot$e");
    }

    return statusDynamic;
  }
}
