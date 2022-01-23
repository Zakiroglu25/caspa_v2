import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/add_attorneys_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/gift_balance.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/promo_code_response.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/presentation/page/gift_balance_page/gift_balance_page.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
//import 'package:http/http.dart' as http;
import 'tarif_provider.dart';

class GiftProvider {
  static Future<StatusDynamic> addGift({required String code}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.addGiftCode;
    var url = Uri.parse(api);
    final body = {"code": code};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    statusDynamic.data = response.data;
    if (response.statusCode == ResultKey.responseSuccess) {
    } else {
      eeee("addGift result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getGiftCodes() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.giftBalances;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    //bbbb('jkl: ' + response.data.toString());

    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data =
          GiftBalanceData.fromJson(gelenCavabJson).giftBalanceList;
    } else {
      eeee(
          "getGiftCodes bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }
}