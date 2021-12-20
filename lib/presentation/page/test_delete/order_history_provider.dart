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
      'Authorization': 'Bearer 1804|XIWIN1t2e6rOeHeRI9rboFoKMW7sh75RkgYCXaOq',
    };
    var url = Uri.parse(api);
    final response = await http.get(url, headers: headers);
    bbbb("rsult: "+response.statusCode.toString()  );
    if (response.statusCode == ResultKey.responseSuccess) {
      var gelenCavabJson = jsonDecode(response.body);
      try {
        gelenCavabJson.map((item) {
          OrderHistoryModel.fromJson(item);
        });
        log("salam"+gelenCavabJson);
        // orderHistoryModel = OrderHistoryModel.fromJson(gelenCavabJson);
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
