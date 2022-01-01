import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/add_attorneys_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:http/http.dart' as http;

class AttorneyProvider {
  static Future<StatusDynamic?> addAttorneys({
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
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.addAttorneys;
    var url = Uri.parse(api);
    final headers = ApiKeys.header(token: accessToken);

    final body = {
      "full_name": full_name,
      "father_name": father_name,
      "phone": phone,
      "fin": fin,
      "id_ext": id_ext,
      "id_number": id_number,
      "birthday": birthday,
      "note": note,
    };

    bbbb("body: " + jsonEncode(body).toString());
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess201) {
      statusDynamic.data = response.body;
    } else {
      eeee("addAttorney result bad:  url: $url  ,  response: ${response.body}");
    }
    return statusDynamic;
  }
  static Future<StatusDynamic?> editAttorneys({
    required int? id,
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
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.editAttorneys;
    var url = Uri.parse(api);
    final headers = ApiKeys.header(token: accessToken);

    final body = {
      "id": id,
      "full_name": full_name,
      "father_name": father_name,
      "phone": phone,
      "fin": fin,
      "id_ext": id_ext,
      "id_number": id_number,
      "birthday": birthday,
      "note": note,
    };

    bbbb("body: " + jsonEncode(body).toString());
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess201) {
      statusDynamic.data = response.body;
    } else {
      eeee("addAttorney result bad:  url: $url  ,  response: ${response.body}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> deleteAttorney({
    required String? accessToken,
    required int id,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.deleteAttorneys;
    var url = Uri.parse(api);
    final headers = ApiKeys.header(token: accessToken);

    final body = {
      "id": id,
    };

    bbbb("body: " + jsonEncode(body).toString());
    final response =
        await http.post(url, headers: headers, body: jsonEncode(body));

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess201) {
      statusDynamic.data = response.body;
    } else {
      eeee("deleteAttorney result bad:  url: $url  ,  response: ${response.body}");
    }
    return statusDynamic;
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
