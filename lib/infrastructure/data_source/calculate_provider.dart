import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/calculate_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';

class CalculateKgProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> addKg({required String kg}) async {
    log("1 provider");

    StatusDynamic statusDynamic = StatusDynamic();
    log("2 provider");

    var api = ApiKeys.calculateKg;
    log("3 provider");

    final response = await dioG.dio.get(api + "?kg=2");
    statusDynamic.statusCode = response.statusCode;
    log("4 provider"+response.statusCode.toString());
    log("5 provider"+response.data.toString());
    if (response.statusCode == ResultKey.responseSuccess) {
      final gelenCavabJson = response.data;
      log("6 provider"+gelenCavabJson);
      CalculateModel calculateModel = CalculateModel.fromJson(gelenCavabJson);
      statusDynamic.data = calculateModel;
      log("7 provider"+calculateModel.toString());
    } else {
      log("8 provider");
      eeee("kg bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }
}
