// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:caspa_v2/infrastructure/configs/dio_x.dart';
import 'package:caspa_v2/infrastructure/models/general/MyMessage.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;

class AuthProvider {
  static Future<http.Response> login ({
    @required String? password,
    @required String? email,
    @required String? deviceCode,
    @required int? deviceType,
    @required String? lang,
  }) async {

    var api = ApiKeys.baseUrl+ApiKeys.login;
    var url = Uri.parse(api);

    var body = ApiKeys.loginApproveBody(
        password: password,
        email: email,
        //todo change test
        device_name: "test");

    final response = await http.post(url,
           headers: ApiKeys.headers,
           body: jsonEncode(body));


    // Response? response ;
    // // try {response= await DioX.client
    // //     .post(
    // //       ApiKeys.login,
    // //       data: jsonEncode(bo),
    // //     );}
    // // on DioError catch(e){
    // //   print("dddfffdsdfsfd");
    // //  // throw Exception(e.response?.data);
    // //
    // // }

    return response;
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
