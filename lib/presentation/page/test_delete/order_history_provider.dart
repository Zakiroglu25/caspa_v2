import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'order_history_model.dart';

class OrderHistoryProvider {
  static Future<List<OrderHistoryModel>?> gerOrderList() async {
    List<OrderHistoryModel>? orderHistoryModel;
    const api = ApiKeys.orderHistory;
    const headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer 1838|6PLaw2nY2lq5IQeydNqXmUnfqCItp2HK6ANrNtcv',
    };
    log("1provider");
    var url = Uri.parse(api);
    log("2provider");
    final response = await http.get(url, headers: headers);
    log("3provider"+url.toString());
    bbbb("rsult: "+response.statusCode.toString()  );
    if (response.statusCode == ResultKey.responseSuccess) {
      log("4provider");
      var gelenCavabJson = jsonDecode(response.body);
      log("5provider");
      try {
        log("6provider");
        // gelenCavabJson.map((item) {
        //   OrderHistoryModel.fromJson(item);
        // });
        log("salam"+gelenCavabJson);
        orderHistoryModel = OrderHistoryModel.fromJson(gelenCavabJson) as List<OrderHistoryModel>?;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString() + "orderHistoryModel");
        }
      }
    } else {
      eeee("bad url :$url,response: $response".toString());
    }
    return orderHistoryModel;
  }
}
