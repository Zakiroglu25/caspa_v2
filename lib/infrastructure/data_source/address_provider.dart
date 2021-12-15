import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:http/http.dart' as http;

class AddressProvider {
  static Future<AddressModel> getAddress() async {
    late AddressModel addressModel;
    const api = ApiKeys.getAddress;
    const headers = ApiKeys.headers;
    var url = Uri.parse(api);
    llll(api);
    final response = await http.get(url, headers: headers);
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = jsonDecode(response.body);
      addressModel = AddressModel.fromJson(gelenCavabJson);
    } else {
      eeee("bad url :$url,response: $response");
    }
    return addressModel;
  }
}
