import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:http/http.dart' as http;

class AttorneyListProvider {
  static Future<AttorneyListModel> getAttorneys({required String? accessToken}) async {
    late AttorneyListModel attorneyListModel;
    const api = ApiKeys.addAttorneys;
    final headers = ApiKeys.header(token: accessToken);
    var url = Uri.parse(api);
    llll(api);
    final response = await http.get(url, headers: headers);
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = jsonDecode(response.body);
      attorneyListModel = AttorneyListModel.fromJson(gelenCavabJson);
    } else {
      eeee("bad url :$url,response: $response");
    }
    return attorneyListModel;
  }
}
