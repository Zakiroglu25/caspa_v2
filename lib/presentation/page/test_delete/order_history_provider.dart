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
    const api = 'https://demoapi.rahatapp.az/v1/couriers/orders/histories';
    const headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer 1804|XIWIN1t2e6rOeHeRI9rboFoKMW7sh75RkgYCXaOq',
    };
    var url = Uri.parse(api);
    final response = await http.get(url, headers: headers);
    bbbb("rsult: " + response.statusCode.toString());
    bbbb("rsult 2: " + response.body);
    if (response.statusCode == ResultKey.responseSuccess) {
      //var gelenCavabJson = jsonDecode(response.body);
      List<OrderHistoryModel> orderModels = [];

      // (jsonDecode((response.body)) as List).forEach((e) {
      //   bbbb("--: " + e['orders'].toString());
      //   List<Orders> orders = [];
      //
      //
      //   // if (e['orders'] != null) {
      //   //   orders = <Orders>[];
      //   //   e['orders'].forEach((v) {
      //   //
      //   //     eeee("iiiiii: "+v.toString());
      //   //
      //   //  //   orders.add(Orders.fromJson(v));
      //   //   });
      //   // }
      //   //
      //   //
      //   // bbbb("oouuouo: " + orders.toString());
      //   // orderModels.add(OrderHistoryModel.fromJson(e));
      //     return OrderHistoryModel.fromJson(e);
      // })

    //  orderModels =

          (json.decode(response.body) as List).forEach((e) {
           final c= OrderHistoryModel.fromJson(e);
            orderModels.add(c);
          });

              //.toList();
      //.toList();
      bbbb("ddd: " + orderModels.toString());
      //  List<OrderHistoryModel> a = orderHistoryResponseFromJson(gelenCavabJson);
      // log("salam: "+a.length .toString());
      return orderModels;
    } else {
      eeee("bad url :$url,response: $response".toString());
    }
    return orderHistoryModel;
  }
}
