// Dart imports:
import 'dart:convert';
import 'dart:io';

import 'package:caspa_v2/infrastructure/models/remote/response/error_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
class ReportProvider {
  static Future<StatusDynamic?> report({
    required String? seller,
    required int? qty,
    required int? category,
    required String? tracking,
    required double? price,
    required String? currency,
    required File? invoice,
    required String? token,
    required String? note,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.report;
    var url = Uri.parse(api);
    final headers = ApiKeys.header(token: token);

    http.MultipartRequest request = new http.MultipartRequest("POST", url);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('invoice', invoice!.path);

    //request.files.add(multipartFile);
    //request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = await 'Bearer $token';

    final body = ApiKeys.reportBody(
      store: seller,
      qty: qty,
      category: category,
      tracking: tracking,
      price: price,
      currency: currency,
      invoice: invoice,
      note: note,
    );
//     bbbb("hohoo 2: "+body.runtimeType.toString());
//     try {
// body.map((String key, dynamic value) => request.fields['$key'] = value);
//     } catch (e) {
//       bbbb("hohoo 55: $e");
//     }


    // "store": store,
    // "qty": qty,
    // "category": category,
    // "tracking": tracking,
    // "price": price,
    // "currency": currency,
    //
    // "note": note,
  //   request.fields['store'] = jsonEncode(seller);
  //   request.fields['qty'] = jsonEncode(qty);
  // //  request.hashCode{}
  //   //= qty!;
  //   request.fields['category'] = jsonEncode(category);
  //   request.fields['tracking'] = jsonEncode(tracking);
  //   request.fields['price'] = jsonEncode(price);
  //   request.fields['currency'] = jsonEncode(currency!.toLowerCase());
  //   request.fields['note'] = jsonEncode(note);
  //   http.MultipartFile(
  //     'invoice',
  //     (http.ByteStream(invoice.openRead())).cast(),
  //     await invoice.length(),
  //     filename: basename(invoice.path),
  //   );
  //
  //   http.StreamedResponse response = await request.send();
  //   print(response.statusCode);
  //   bbbb("hohoo 3: ");
  //   http.StreamedResponse responseK = await request.send();
  //   //bbbb("hohoo 4: "+response.statusCode .toString());
  //   String a = await response.stream.bytesToString();
  //   bbbb("hohoo 1: " + a .toString());
  //   final realResponse = jsonDecode(a);
  //   if (realResponse['statusCode'] == ResultKey.responseSuccess) {
  //     //return GeneralResponse.fromJson(realResponse);
  //   } else {
  //     throw HttpException("Error occurred with statusCode.statusCode}");
  //   }

    //final String endPoint = 'http://10.0.2.2:8000/analyze';
    String fileName = invoice.path.split('/').last;
    print(fileName);
    FormData? data;
try{
   data = FormData.fromMap({
    "invoice": await MultipartFile.fromFile(
      invoice.path,
      filename: "hjnjnj.png",
    ),

    "store":"Trendyol",
    "qty":1,
    "category":4,
    "tracking":"izleme kodu",
    "price":77.5,
    "currency":"try",
    "note":"qara renginden xl"
  });
}catch(e){

  eeee(":::: "+e.toString());
};

    Dio dio = new Dio(BaseOptions(headers: headers));
  //  bbbb("jjjj KKK: "+data!.files[0].value.filename .toString());
    dio.post(api, data:data).then((response) {
      var jsonResponse = jsonDecode(response.toString());

      bbbb("jjjj: "+jsonResponse .toString());
      var testData = jsonResponse['histogram_counts'].cast<double>();
      var averageGrindSize = jsonResponse['average_particle_size'];
    }).catchError((error) => print(error));


    // final response =
    //     await http.post(url, headers: headers, body: jsonEncode(body));
    // // bbbb("response company register: :" + response.body);
    // bbbb("hohoo 1: "+response.statusCode.toString());
    // bbbb("hohoo");
    // bbbb(" report  static body: :" + jsonEncode(body));
    //
    // statusDynamic.statusCode = response.statusCode;
    //
    // if (response.statusCode == ResultKey.successCode) {
    //   // String accessToken = response.body;
    //   // statusDynamic.data = accessToken;
    //   bbbb("new token: " + (statusDynamic.data).toString());
    // } else {
    //   statusDynamic.data =
    //       AppOperations.errorFromListOfListAsList(response.body);
    //   eeee("report bad url :$url,response: ${response}");
    // }

    return statusDynamic;
  }
}
