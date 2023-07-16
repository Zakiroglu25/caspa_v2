// Dart imports:
import 'dart:convert';

import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';

class OrderViaLinkProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic?> orderViaLink({
    required int? qty,
    required double? price,
    required String? link,
    required double? cargo_price,
    required String? detail,
    required String? token,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.orderViaLink;

    var body = ApiKeys.orderViaLinkBody(
        link: link,
        price: price,
        cargo_price: cargo_price,
        detail: detail,
        qty: qty);

    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("orderViaLink bad url :$api ,response: ${response}");
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

    var body = ApiKeys.orderViaLinkBody(
        link: link,
        price: price,
        cargo_price: cargo_price,
        detail: detail,
        id: id,
        qty: qty);
    bbbb("iiii: " + jsonEncode(body));
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("editOrder bad url :$api ,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> delete({required int id}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.orderViaLinkDelete;
    var body = {"id": id};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.data;
    } else {
      eeee("deleteOrder bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<LinkOrderResponse> getOrders() async {
    late LinkOrderResponse attorneyListModel;
    const api = ApiKeys.orderViaLink;
    final response = await dioAuth.dio.get(api);
    print(response);
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      attorneyListModel = LinkOrderResponse.fromJson(gelenCavabJson);
    } else {
      eeee("getOrders bad url :$api ,response: $response");
    }
    return attorneyListModel;
  }
}
