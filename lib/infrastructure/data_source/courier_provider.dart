import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:dio/dio.dart';

import '../../locator.dart';
import '../models/remote/response/courier_orders_model.dart';

class CourierProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> addCourier(
      {required String phone,
      required String adress,
      required int regionId,
      int? courierId,
      required List<int> packages}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = courierId == null ? ApiKeys.addCourier : ApiKeys.editCourier;
    final body = {
      'id': courierId,
      "phone": phone,
      "address": adress,
      "region": regionId,
      "package": packages
    };
    bbbb("boddddd: $body");
    final response = await dioAuth.dio.post(api, data: body);

    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      //   PackagesData package = PackagesData.fromJson(gelenCavabJson);
      statusDynamic.data = response.data;
    } else {
      eeee("addCourier bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> fetchCourier() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.courierList;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      // log("3 provider"+response.statusCode.toString());
      var gelenCavabJson = jsonDecode(response.toString());
      // log("4 provider"+gelenCavabJson.toString());
      CourierListModel courierList = CourierListModel.fromJson(gelenCavabJson);
      statusDynamic.data = courierList.data;
      bbbb("courier list: " + (statusDynamic.data).toString());
    } else {
      eeee("courier List bad url :$api ,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> deleteCourier({
    required String? accessToken,
    required int id,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.deleteCourier;

    final body = {
      "id": id,
    };
    bbbb("body: " + jsonEncode(body).toString());
    // final response =
    //     await http.post(url, headers: headers, body: jsonEncode(body));
    final response = await dioAuth.dio.post(api, data: body);

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess201) {
      statusDynamic.data = response.data;
    } else {
      eeee(
          "deleteCourier result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> updateCourier(
      {required String phone,
      required String adress,
      required int regionId,
      required int id,
      required List<int> packages}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.editCourier;
    final body = {
      "phone": phone,
      "address": adress,
      "region": regionId,
      "package": packages,
      "id": id
    };
    log(body.toString());
    final response = await dioAuth.dio.post(api, data: body);

    eeee("respopop: ${response.requestOptions.data}");
    eeee("respopop: ${response.data}");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data = response.data;
    } else {
      eeee("editCourier bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }
}
