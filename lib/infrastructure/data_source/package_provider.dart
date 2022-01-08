// Dart imports:
import 'dart:convert';

import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

class PackageProvider {
  static Future<StatusDynamic?> fetchAllPackages(String token) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.allPackages;
    var url = Uri.parse(api);
    var headers=ApiKeys.header(token: token);

    final response = await http.get(url, headers: headers);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = jsonDecode(response.body);
      PackagesData userResult = PackagesData.fromJson(gelenCavabJson);
      statusDynamic.data  = userResult.data ;
      bbbb("packages data : " + (statusDynamic.data).toString());
    } else {
      eeee("fetchAllPackages bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }
}
