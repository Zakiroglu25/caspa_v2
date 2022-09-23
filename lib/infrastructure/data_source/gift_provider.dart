import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/gift_balance.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

//import 'package:http/http.dart' as http;
import '../../locator.dart';

class GiftProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic> addGift({required String code}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.addGiftCode;
    final body = {"code": code};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    statusDynamic.data = response.data;
    if (response.statusCode == ResultKey.responseSuccess) {
    } else {
      eeee("addGift result bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> getGiftCodes() async {
    StatusDynamic statusDynamic = StatusDynamic();
    const api = ApiKeys.giftList;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    //bbbb('jkl: ' + response.data.toString());

    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      statusDynamic.data = GiftBalanceData.fromJson(gelenCavabJson).giftBalanceList;
    } else {
      eeee(
          "getGiftCodes bad url :${response.requestOptions.path},response: $response");
    }
    return statusDynamic;
  }
}
