import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';

class ForgotProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic?> sendMail({
    required String? phone,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.forgotOtp;

    final body = {
      "phone": phone,
    };
    final response = await dioG.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      statusDynamic.data = response.data;
    } else {
      statusDynamic.data = response.data;
      eeee(
          "sendMail result bad:  url: ${response.requestOptions.path}  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> addCode({
    required String? phone,
    required String? code,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.forgotOtpApprove;

    final body = {"phone": phone, 'otp': code};
    final response = await dioG.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      statusDynamic.data = response.data;
    } else {
      eeee(
          "addCode result bad:  url: ${response.requestOptions.path}  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<AttorneyListModel> getAttorneys(
      {required String? accessToken}) async {
    late AttorneyListModel attorneyListModel;
    const api = ApiKeys.addAttorneys;
    final headers = ApiKeys.header(token: accessToken);

    llll(api);
    //final response = await http.get(url, headers: headers);
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
