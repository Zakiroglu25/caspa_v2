import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/add_attorneys_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
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
    final headers = ApiKeys.header(token: accessToken);
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
      eeee("addAttorney result bad:  url: $url  ,  response: ${response.body}");
    }
    return addAttorneys;
  }

  static Future<AddAttorneysModel?> deleteAttorney(
      {required int id, required String accessToken}) async {
    AddAttorneysModel? deleteAttorneys;
    const api = ApiKeys.addAttorneys;
    final headers = ApiKeys.header(token: accessToken);
    var url = Uri.parse(api);
    final response = await http.post(url, headers: headers);
    if (response.statusCode == ResultKey.responseSuccess) {
      var dataGelenCavabJSON = jsonDecode(response.body);
      deleteAttorneys = AddAttorneysModel.fromJson(dataGelenCavabJSON);

      return deleteAttorneys;
    } else {
      eeee(
          "delete attorney result bad:  url: $url  ,  response: ${response.body}");
      return null;
    }
  }

  static Future<AddAttorneysModel?> updateAttorney({
    required String? accessToken,
    required String? full_name,
    required String? father_name,
    required String? phone,
    required String? id_ext,
    required String? id_number,
    required String? fin,
    required String? birthday,
    required String? note,
    required int? id,
  }) async {
    AddAttorneysModel? updateAttorneys;

    final api = ApiKeys.addAttorneys;
    final headers = ApiKeys.header(token: accessToken);
    final url = Uri.parse(api);
    final response =
        await http.post(url, headers: headers, body:  jsonEncode({
        "full_name": full_name,
        "father_name": father_name,
        "phone": phone,
        "id_ext": "AZ",
        "id_number": id_number,
        "birthday": birthday,
        "note": note,
        "id": id
        }));
    if (response.statusCode == ResultKey.responseSuccess) {
      final dataGelenCavabJSON = jsonDecode(response.body);
      updateAttorneys = AddAttorneysModel.fromJson(dataGelenCavabJSON);

      return updateAttorneys;
    } else {
      eeee(
          "updateAttorney result bad:  url: $url  ,  response: ${response.body}");
      return null;
    }
  }
}

class AttorneyListProvider {
  static Future<AttorneyListModel> getAttorneys(
      {required String? accessToken}) async {
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
