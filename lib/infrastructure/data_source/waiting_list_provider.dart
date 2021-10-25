// // Dart imports:
// import 'dart:convert';
//
// // Flutter imports:
// import 'package:flutter/material.dart';
// // Package imports:
// import 'package:http/http.dart' as http;
// import 'package:optimal/infrastructure/model/general/general_response_model.dart';
// import 'package:optimal/infrastructure/model/market/waiting_list_model.dart';
// import 'package:optimal/util/constants/api_keys.dart';
// import 'package:optimal/util/constants/result_keys.dart';
// import 'package:optimal/util/delegates/my_printer.dart';
//
// class WaitingListProvider {
//   static Future<WaitingListModel> getWaitingList(
//       {@required String lang, String accessToken, String customerId}) async {
//     WaitingListModel waitingListModel;
//     final api = ApiKeys.getWaitingList;
//     // final headers = ApiKeys.headers;
//     final headers = {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $accessToken',
//     };
//     var url = Uri.parse(api + '/$lang');
//     llll("getWaitingList: " + url.toString());
//     final response = await http.get(url, headers: headers);
//
//     if (response.statusCode == ResultKey.responseSuccess) {
//       var dataGelenCavabJSON = jsonDecode(response.body);
//       waitingListModel = WaitingListModel.fromJson(dataGelenCavabJSON);
//
//       // wtf("vavo: "+waitingListModel.result.toString());
//     } else {
//       eeee(
//           "getWaitingList result bad:  url: $url  ,  response: ${response.body}");
//     }
//     return waitingListModel;
//   }
//
//   static Future<WaitingListModel> addWaitingList(
//       {@required String accessToken, @required int goodsId}) async {
//     WaitingListModel waitingListModel;
//     final api = ApiKeys.addWaitingList;
//     //final headers = ApiKeys.headers;
//     final headers = {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $accessToken',
//     };
//     var url = Uri.parse(api);
//     llll("addWaitingList: " + url.toString());
//     var body = {"id": 0, "goodsId": goodsId};
//     final response =
//         await http.post(url, headers: headers, body: jsonEncode(body));
//
//     if (response.statusCode == ResultKey.responseSuccess) {
//       var dataGelenCavabJSON = jsonDecode(response.body);
//       waitingListModel = WaitingListModel.fromJson(dataGelenCavabJSON);
//     } else {
//       eeee(
//           "addWaitingList result bad:  url: $url  ,  response: ${response.body}");
//     }
//     return waitingListModel;
//   }
//
//   static Future<GeneralResponse> removeFromWaitingList(
//       {@required String accessToken, @required int id}) async {
//     GeneralResponse generalResponse;
//     final api = ApiKeys.removeFromWaitingList;
//     //final headers = ApiKeys.headers;
//     final headers = {
//       "Content-Type": "application/json",
//       'Authorization': 'Bearer $accessToken',
//     };
//     //  var url = Uri.parse(api);
//     // var body = {"id": 0,  "goodsId": goodsId};
//     // final response =
//     //     await http.post(url, headers: headers, body: jsonEncode(body));
//
//     var url = Uri.parse(api + '/$id');
//     llll("removeFromWaitingList: " + url.toString());
//     final response = await http.post(url, headers: headers);
//     if (response.statusCode == ResultKey.responseSuccess) {
//       var dataGelenCavabJSON = jsonDecode(response.body);
//       generalResponse = GeneralResponse.fromJson(dataGelenCavabJSON);
//     } else {
//       eeee(
//           "removeFromWaitingList result bad:  url: $url  ,  response: ${response.body}");
//     }
//     return generalResponse;
//   }
// }
//
// // /WaitingList/GetWaitingLists
