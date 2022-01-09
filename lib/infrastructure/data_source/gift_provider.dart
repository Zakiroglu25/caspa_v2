
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/gift_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import 'tarif_provider.dart';

class GiftProvider {
  static Future<StatusDynamic> addGift({required String code}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.addGift;
    var url = Uri.parse(api);
    final body = {"code": code};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      statusDynamic.data = response.data;
    } else {
      eeee(
          "addPromoCode result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  ///ok
// {
// "message": "Balansınıza 3.00 - 1.76 usd əlavə edildi :). "
// }
  /// error
// {
//     "key": null,
//     "message": "Hədiyyə kodu yalnışdır və ya artıq istifadə edilib"
// }

  static Future<GiftModel>? getGift() async {
    GiftModel giftModel = GiftModel();
    const api = ApiKeys.giftList;
    final response = await dioAuth.dio.get(api);
    // giftModel.statusCode=response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      giftModel = GiftModel.fromJson(gelenCavabJson);
    } else {
      eeee(
          "getPromoCodes bad url :${response.requestOptions.path},response: $response");
    }
    return giftModel;
  }
}
