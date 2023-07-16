// Dart imports:
import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/data_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';
import '../../util/constants/text.dart';

class PackageProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> fetchAllPackages() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.allPackages;
    //var url = Uri.parse(api);
    //var headers = ApiKeys.header(token: token);

    final response = await dioAuth.dio.get(api);
    //final response = await http.get(url, headers: headers);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      PackagesData userResult = PackagesData.fromJson(gelenCavabJson);
      statusDynamic.data = userResult.data;
      //bbbb("packages data : " + (statusDynamic.data).toString());
    } else {
      eeee("fetchAllPackages bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> fetchPackagesForCourier() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.packagesForCourier;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      PackagesData package = PackagesData.fromJson(gelenCavabJson);
      statusDynamic.data = package.data;
      //bbbb("packages data : " + (statusDynamic.data).toString());
    } else {
      eeee("fetchPackagesForCourier bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> fetchPackagesWithStatuses() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.packagesStatuses;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      DataModel package = DataModel.fromJson(gelenCavabJson);
      statusDynamic.data = package.data;
    } else {
      eeee("fetchPackagesWithStatuses bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> fetchActivePackages() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.packagesActives;
    final response = await dioAuth.dio.get(api);
    statusDynamic.statusCode = response.statusCode;

    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      DataModel package = DataModel.fromJson(gelenCavabJson);
      statusDynamic.data = package.data;
    } else {
      eeee("fetchPackagesWithStatuses bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic?> deletePackage({
    required int? id,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.packagesArchive + "?id=$id";
    iiii(api + "Provider");

    final response = await dioAuth.dio.get(api);
    iiii(response.toString() + "Provider");
    statusDynamic.statusCode = response.statusCode;
    if (statusDynamic.statusCode == ResultKey.successCode) {
      // statusDynamic.data=response['message'];
      bbbb("silindi");
    } else {
      statusDynamic.data = MyText.reportIsNotAdded;
    }
    return statusDynamic;
  }
}
