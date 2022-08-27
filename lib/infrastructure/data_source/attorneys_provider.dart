import 'dart:convert';
import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/add_attorneys_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import '../../locator.dart';
import 'tarif_provider.dart';

class AttorneyProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
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
    // final response = await http.post(url, headers: headers, body: jsonEncode(body));
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess201) {
      statusDynamic.data = response.data;
    } else {
      eeee(
          "addAttorney result bad:   v3url: $api  ,  response: ${response.headers}");
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
    final response = await dioAuth.dio.post(api, data: body);

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess201) {
      statusDynamic.data = response.data;
    } else {
      eeee("addAttorney result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> deleteAttorney({
    required String? accessToken,
    required int id,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.deleteAttorneys;

    final body = {
      "id": id,
    };
    bbbb("body: " + jsonEncode(body).toString());
    // final response =
    //     await http.post(url, headers: headers, body: jsonEncode(body));
    final response = await dioAuth.dio.post(api, data: body);

    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.responseSuccess201) {
      statusDynamic.data = response.data;
    } else {
      eeee(
          "deleteAttorney result bad:  url: $api  ,  response: ${response.data}");
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
    final body = {
      "full_name": full_name,
      "father_name": father_name,
      "phone": phone,
      "id_ext": "AZ",
      "id_number": id_number,
      "birthday": birthday,
      "note": note,
      "id": id
    };
    // final response = await http.post(url,
    //     headers: headers,
    //     body: jsonEncode(body));
    final response = await dioAuth.dio.post(api, data: body);

    if (response.statusCode == ResultKey.responseSuccess) {
      final dataGelenCavabJSON = response.data;
      updateAttorneys = AddAttorneysModel.fromJson(dataGelenCavabJSON);

      return updateAttorneys;
    } else {
      eeee(
          "updateAttorney result bad:  url: $url  ,  response: ${response.data}");
      return null;
    }
  }

  static Future<AttorneyListModel> getAttorneys(
      {required String? accessToken}) async {
    late AttorneyListModel attorneyListModel;
    const api = ApiKeys.addAttorneys;
    final response = await dioAuth.dio.get(api);
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      attorneyListModel = AttorneyListModel.fromJson(gelenCavabJson);
    } else {
      eeee("bad url :$api ,response: $response");
    }
    return attorneyListModel;
  }
}
