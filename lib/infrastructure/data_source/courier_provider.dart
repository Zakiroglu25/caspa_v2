import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';

class CourierProvider {
  static DioAuth get dioAuth => locator<DioAuth>();
  static Future<StatusDynamic> addCourier(
      {required String phone,
      required String adress,
      required int regionId,
      required List<int> packages}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.addCourier;
    final body = {
      "phone": phone,
      "address": adress,
      "region": regionId,
      "package": packages
    };
    final response = await dioAuth.dio.post(api, data: body);

    eeee("respopop: ${response.requestOptions.data}");
    eeee("respopop: ${response.data}");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      PackagesData package = PackagesData.fromJson(gelenCavabJson);
      statusDynamic.data = package.data;
    } else {
      eeee("fetchPackagesForCourier bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }
}
