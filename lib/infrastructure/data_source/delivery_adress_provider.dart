// Dart imports:
import 'dart:convert';

import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

// Package imports:
import 'package:http/http.dart' as http;

import '../../locator.dart';
import '../models/remote/response/delivery_address_model.dart';

class DeliveryAdressProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic?> add({
    int? id,
    required int? region,
    required String name,
    required String phone,
    required String address,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = id == null ? ApiKeys.addAddress : ApiKeys.editAddresses;
    var body = ApiKeys.addressBody(
        id: id, name: name, address: address, phone: phone, region: region);
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("add or edit adress bad url :$api ,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> editOrder(
      {required int? qty,
      required double? price,
      required String? link,
      required double? cargo_price,
      required String? detail,
      required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.orderViaLinkEdit;
    var url = Uri.parse(api);
    //final headers = ApiKeys.header(token: token);
    var body = ApiKeys.orderViaLinkBody(
        link: link,
        price: price,
        cargo_price: cargo_price,
        detail: detail,
        id: id,
        qty: qty);
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("editOrder bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> delete({required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.deleteAddress + "?id=$id";
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("deleteOrder bad url :$api, response: ${response}");
    }
    return statusDynamic;
  }

  static Future<DeliveryAdressResponse?> getAddresses() async {
    DeliveryAdressResponse? deliveryAdressResponse;
    const api = ApiKeys.addresses;
    var url = Uri.parse(api);
    final response = await dioAuth.dio.get(api);
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      deliveryAdressResponse = DeliveryAdressResponse.fromJson(gelenCavabJson);
    } else {
      eeee("getOrders bad url :$url,response: $response");
    }
    return deliveryAdressResponse;
  }
}