// Dart imports:
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/configs/recorder.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:dio/dio.dart';

// Package imports:
import 'dart:io';

import '../../locator.dart';

class ReportProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic?> report({
    required String? seller,
    required int? qty,
    int? id,
    required int? category,
    required String? tracking,
    required double? price,
    required String? currency,
    File? invoice,
    required String? token,
    required String? note,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = id != null ? ApiKeys.editReport : ApiKeys.report;
    var url = Uri.parse(api);
    final headers = ApiKeys.header(token: token);

    var data;

    if (invoice == null) {
      data = {
        "store": seller,
        "qty": qty,
        "id": id,
        "category": category,
        "tracking": tracking,
        "price": price,
        "currency": currency,
        "note": note
      };
    } else {
      data = FormData.fromMap({
        "invoice": await MultipartFile.fromFile(
          invoice.path,
          filename: "invoice.png",
        ),
        "store": seller,
        "qty": qty,
        "id": id,
        "category": category,
        "tracking": tracking,
        "price": price,
        "currency": currency,
        "note": note
      });
    }

    log(invoice.toString() + "salam");

    // await MultipartFile.fromFile(
    //   invoice!.path,
    //   filename: "invoice.png",
    // )
    Dio dio = new Dio(BaseOptions(headers: headers));
    final response = await dio.post(api, data: data).then((response) {
      var jsonResponse = jsonDecode(response.toString());
      log(response.toString());
      statusDynamic.statusCode = response.statusCode;
      bbbb("report st code: " + statusDynamic.statusCode.toString());
    }).catchError((e, s) {
      statusDynamic.statusCode = (e as DioError).response?.statusCode;
      Recorder.recordCatchError(e, s);
    });

    if (statusDynamic.statusCode == ResultKey.successCode) {
      // statusDynamic.data=response['message'];

    } else {
      statusDynamic.data = MyText.reportIsNotAdded;
    }

    return statusDynamic;
  }

  static Future<StatusDynamic?> deleteReport({
    required int? id,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.deleteReport;
    var url = Uri.parse(api);
    // final headers = ApiKeys.header(token: token);
    final data = {"id": id};
    final response = await dioAuth.dio.post(api, data: data);
    statusDynamic.statusCode = response.statusCode;
    if (statusDynamic.statusCode == ResultKey.successCode) {
      // statusDynamic.data=response['message'];
      bbbb("silindi");
    } else {
      statusDynamic.data = MyText.reportIsNotAdded;
    }

    return statusDynamic;
  }
}
