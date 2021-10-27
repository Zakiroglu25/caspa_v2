// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';
// Package imports:
import 'package:http/http.dart' as http;

class AuthProvider {
  // static Future<AddComment> addComment({
  //   @required int goodsId,
  //   @required String username,
  //   @required int rate,
  //   @required String comment,
  // }) async {
  //   AddComment addComment;
  //   var api = ApiKeys.addComment;
  //
  //   final headers = ApiKeys.headers;
  //   var url = Uri.parse(api);
  //   llll("updateCart provider url: " + url.toString());
  //   final response = await http.post(url,
  //       headers: headers,
  //       body: jsonEncode({
  //         "goodsId": goodsId,
  //         "username": username,
  //         "comment": comment,
  //         "createDate": "2021-06-10T08:53:19.808Z",
  //         "rate": rate
  //       }));
  //
  //   if (response.statusCode == ResultKey.responseSuccess) {
  //     var dataGelenCavabJSON = jsonDecode(response.body);
  //     //print("addComment result: $dataGelenCavabJSON");
  //     addComment = AddComment.fromJson(dataGelenCavabJSON);
  //   } else {
  //     eeee("addComment result bad:  url: $url  ,  response: ${response.body}");
  //   }
  //   return addComment;
  // }
}
