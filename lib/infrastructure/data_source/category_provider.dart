import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:http/http.dart' as http;

class CategoryProvider {
  static Future<StatusDynamic> getCategory() async {
    StatusDynamic statusDynamic = StatusDynamic();

    final api = ApiKeys.categories;
    final headers = ApiKeys.headers;
    var url = Uri.parse(api);
    llll(api);

    final response = await http.get(url, headers: headers);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = jsonDecode(response.body);
      CategoriesData categoriesData = CategoriesData.fromJson(gelenCavabJson);

      statusDynamic.data  = categoriesData.data ;
     // bbbb("st: "+(statusDynamic.data) .toString());
    } else {
      eeee("getCategory bad url :$url,response: ${response}");
    }

    return statusDynamic;
  }
}
