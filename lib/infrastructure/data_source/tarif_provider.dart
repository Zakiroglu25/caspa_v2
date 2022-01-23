import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/configs/dio_general.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/locator.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

DioG get dioG => locator<DioG>();

class TarifProvider {
  static HiveService get _prefs => locator<HiveService>();

  static Future<TariffData> getTarif() async {
    late TariffData priceModel;
    final api = ApiKeys.tariff;
    final headers = ApiKeys.headers;
    var url = Uri.parse(api);
    llll(api);

    final response = await dioG.dio.get(api);
    // _prefs.user;
    //final responseX = await http.get(url, headers: headers);

    // bbbb("resuu: " + response.data .toString());
    //  bbbb("resuu X: " + responseX.body .toString());
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      priceModel = TariffData.fromJson(gelenCavabJson);
    } else {
      eeee("bad url :$url,response: ${response}");
    }
    return priceModel;
  }
}
