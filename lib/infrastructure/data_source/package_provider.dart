// Dart imports:
import 'dart:convert';

import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/data_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/package_and_count_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

import '../../locator.dart';

class PackageProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic> fetchAllPackages() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.allPackages;
    //var url = Uri.parse(api);
    //var headers = ApiKeys.header(token: token);

    final response = await dioAuth.dio.get(api);
    //final response = await http.get(url, headers: headers);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      PackagesData userResult = PackagesData.fromJson(gelenCavabJson);
      statusDynamic.data = userResult.data;
      //bbbb("packages data : " + (statusDynamic.data).toString());
    } else {
      eeee("fetchAllPackages bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> fetchPackagesForCourier() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.packagesForCourier;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      PackagesData package = PackagesData.fromJson(gelenCavabJson);
      statusDynamic.data = package.data;
      //bbbb("packages data : " + (statusDynamic.data).toString());
    } else {
      eeee("fetchPackagesForCourier bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> fetchPackagesWithStatuses() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.packagesStatuses;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    //bbbb("packages data : " + (response.data).toString());
    // bbbb("packages data : " + (jsonEncode(response.data)).toString());
    //
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      DataModel package = DataModel.fromJson(gelenCavabJson);
      statusDynamic.data = package.data;
    } else {
      eeee("fetchPackagesWithStatuses bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }
}
