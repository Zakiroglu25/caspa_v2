import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/add_attorneys_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
//import 'package:http/http.dart' as http;
import 'tarif_provider.dart';

class PromoCodeProvider {
  static Future<StatusDynamic> addPromoCode({required String code}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.promoCodes;
    var url = Uri.parse(api);
    final body = {"code": code};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      statusDynamic.data = response.data;
    } else {
      eeee("addPromoCode result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getPromoCodes() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.promoCodes;
    final response =
    await dioAuth.dio .get(api);
    statusDynamic.statusCode=response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data = AttorneyListModel.fromJson(gelenCavabJson);
    } else {
      eeee("getPromoCodes bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }
}
