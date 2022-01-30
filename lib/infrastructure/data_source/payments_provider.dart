import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';

class PaymentsProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> getPaymentUrl({required double? amount}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.paymentOrder;
    var url = Uri.parse(api);
    final body = {"amount": amount};
    final response = await dioAuth.dio.post(api, data: body);
    statusDynamic.statusCode = response.statusCode;
    statusDynamic.data = response.data;
    if (response.statusCode == ResultKey.responseSuccess) {
    } else {
      eeee(
          "payment order result bad:  url: $url  ,  response: ${response.data}");
    }
    return statusDynamic;
  }
}
