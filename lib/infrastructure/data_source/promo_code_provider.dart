import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/promo_code_response.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

//import 'package:http/http.dart' as http;
import '../../locator.dart';

class PromoCodeProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic> addPromoCode({required String code}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.addPromoCode;
    final body = {"code": code};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    statusDynamic.data = response.data;
    if (response.statusCode == ResultKey.responseSuccess) {
    } else {
      eeee(
          "addPromoCode result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getPromoCodes() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.promoCodes;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    bbbb('jkl: ' + response.requestOptions.headers.toString());

    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data = PromoCodeData.fromJson(gelenCavabJson).promoCodeList;
    } else {
      eeee(
          "getPromoCodes bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> checkPromoCode() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.checkPromoCode;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data = gelenCavabJson;
    } else {
      eeee(
          "checkPromoCode bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }
}
