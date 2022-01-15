import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

class CourierProvider {
  static Future<StatusDynamic> addCourier(
      String phone, String adress, String region, List<int> packages) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.addCourier;
    final body = {
      "phone": phone,
      "address": adress,
      "region": 1,
      "package": packages
    };
    final response = await dioAuth.dio.post(api, data: body);
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
