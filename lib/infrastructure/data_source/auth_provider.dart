// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:caspa_v2/infrastructure/configs/dio_x.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

class AuthProvider {
  static Future<dynamic> login({
    @required String? password,
    @required String? email,
    @required String? deviceCode,
    @required int? deviceType,
    @required String? lang,
  }) async {
   // AddComment addComment;
    var api = ApiKeys.login;

    final headers = ApiKeys.headers;
    var url = Uri.parse(api);
    llll("updateCart provider url: " + url.toString());

    var body = ApiKeys.loginApproveBody(
        password: password,
        email: email,
        //todo change test
        device_name: "test");

    final response = await DioX.client.options.headers
        .update('Authorization', (value) => "Bearer test")
        .post(
          ApiKeys.login,
          data: jsonEncode(body),
        );

    if (response.statusCode == ResultKey.responseSuccess) {
      var dataGelenCavabJSON = jsonDecode(response.body);
      //print("addComment result: $dataGelenCavabJSON");
      //addComment = AddComment.fromJson(dataGelenCavabJSON);
    } else {
      eeee("addComment result bad:  url: $url  ,  response: ${response.body}");
    }
    //return addComment;
  }

  // static Future<List<Comment>> getCommentsWithPostID(int postID) async {
  //   List<Comment> commentList;
  //   final response = await DioX.client.get(
  //     "${ApiKeys.comments}?postId=$postID",
  //   );
  //   List responseData = response.data;
  //   commentList = responseData
  //       .map((currentComment) => Comment.fromJson(currentComment))
  //       .toList();
  //   return commentList;
  // }
}
