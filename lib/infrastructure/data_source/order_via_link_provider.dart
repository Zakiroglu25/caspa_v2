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
    var url = Uri.parse(api);
    final headers = ApiKeys.header(token: token);
    var body = ApiKeys.orderViaLinkBody(
        link: link,
        price: price,
        cargo_price: cargo_price,
        detail: detail,
        qty: qty);
    bbbb("iiii: " + jsonEncode(body));
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      statusDynamic.data = response.body;
    } else {
      eeee("orderViaLink bad url :$url,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<LinkOrderResponse> getOrders() async {
    late LinkOrderResponse attorneyListModel;
    const api = ApiKeys.orderViaLink;
    var url = Uri.parse(api);
    final response = await dioAuth.dio.get(api);
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      attorneyListModel = LinkOrderResponse.fromJson(gelenCavabJson);
    } else {
      eeee("getOrders bad url :$url,response: $response");
    }
    return attorneyListModel;
  }
}
