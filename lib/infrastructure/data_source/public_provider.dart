// Dart imports:
import 'dart:convert';
import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/base.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/big_data_info.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/error_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/google_map_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../locator.dart';
import '../models/remote/response/branches_model.dart';
import '../models/remote/response/wares.dart';

class PublicProvider {
  static Future<StatusDynamic> getRegions() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.regions;
    final response = await dioG.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data = RegionData.fromJson(gelenCavabJson).data;
    } else {
      eeee(
          "getRegions bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getLocDataFromBigData(
      {required double lat, required double long}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    final api = ApiKeys.localityInfoBigData +
        "?latitude=$lat&longitude=$long&localityLanguage=az";
    final response = await dioG.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data =
          BigDataCloudResponse.fromJson(gelenCavabJson).localityInfo;
    } else {
      eeee(
          "getLocData bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getLocDataFromGoogleMap(
      {required double lat, required double long}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    final api = ApiKeys.localityInfoGoogleMap +
        "?latlng=$lat,$long&key=${Configs.googleMapKey}";
    final response = await dioG.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data =
          GoogleMapDataResponse.fromJson(gelenCavabJson).results;
    } else {
      eeee(
          "getLocData bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getWares() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.wares;
    final response = await dioG.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data = Wares.fromJson(gelenCavabJson).data;
    } else {
      eeee(
          "getWares bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getBranch() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.branches;
    final response = await dioG.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data = Branches.fromJson(gelenCavabJson).data;
    } else {
      eeee(
          "getBranches bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }
}
