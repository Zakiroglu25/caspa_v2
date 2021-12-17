// Dart imports:
import 'dart:convert';

import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

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
      statusDynamic.data  = userResult.data ;
      bbbb("shop list: " + (statusDynamic.data).toString());
    } else {
      eeee("fetchShops bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }
}
