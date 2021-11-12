import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:http/http.dart' as http;

class TarifProvider {
  static Future<PriceModel> getTarif() async {
    late PriceModel priceModel;
    final api = ApiKeys.getTarif;
    final headers = ApiKeys.headers;
    var url = Uri.parse(api);
    log(url.toString());
    final response = await http.get(url, headers: headers);
    if (response.statusCode == ResultKey.success) {
      var gelenCavabJson = jsonDecode(response.body);
      priceModel = PriceModel.fromJson(gelenCavabJson);
    } else {
      log("bad url :$url,response: ${response.body}");
    }
    return priceModel;
  }
}
