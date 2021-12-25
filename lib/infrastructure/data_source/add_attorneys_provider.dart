import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/add_attorneys_model.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:http/http.dart' as http;

class AddAttorneysProvider {
  static Future<AddAttorneysModel?> addAttorneys({
    required String? accessToken,
    required String? full_name,
    required String? father_name,
    required String? phone,
    required String? id_ext,
    required String? id_number,
    required String? fin,
    required String? birthday,
    required String? note,
  }) async {
    AddAttorneysModel? addAttorneys;
    var api = ApiKeys.addAttorneys;
    var url = Uri.parse(api);
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $accessToken',
    };
    //llll("add attorney url :" + url.toString());
    final response = await http.post(url,
        headers: headers,
        body: jsonEncode({
          "full_name": full_name,
          "father_name": father_name,
          "phone": phone,
          "id_ext": "AZ",
          "id_number": id_number,
          "birthday": birthday,
          "note": note,
        }));
    if (response.statusCode == ResultKey.responseSuccess) {
      var dataGelenCavabJSON = jsonDecode(response.body);
      addAttorneys = AddAttorneysModel.fromJson(dataGelenCavabJSON);
    } else {
      eeee("addComment result bad:  url: $url  ,  response: ${response.body}");
    }
    return addAttorneys;
  }
}
