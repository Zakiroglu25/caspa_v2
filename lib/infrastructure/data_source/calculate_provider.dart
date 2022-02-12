import 'package:caspa_v2/infrastructure/configs/dio_auth.dart';
import 'package:caspa_v2/infrastructure/data_source/tarif_provider.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/calculate_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';

class CalculateKgProvider {
  static DioAuth get dioAuth => locator<DioAuth>();

  static Future<StatusDynamic> addKg({required String kg}) async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.calculateKg;
    final response = await dioG.dio.get(api + "?kg=$kg");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      final gelenCavabJson = response.data;
      CalculateModel calculateModel = CalculateModel.fromJson(gelenCavabJson);
      statusDynamic.data = calculateModel;
    } else {
      eeee("kg bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }

  static Future<StatusDynamic> capacity({
    required String? width,
    required String? height,
    required String? lenght,
    required bool size,
  }) async {
    StatusDynamic statusDynamic = StatusDynamic();

    var api = ApiKeys.calculateKg;

    final response = await dioG.dio.get(api + "?width=$width&height=$height&lenght=$lenght&size=$size");
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.responseSuccess) {
      final gelenCavabJson = response.data;
      // log("6 provider"+gelenCavabJson);
      CalculateModel calculateModel = CalculateModel.fromJson(gelenCavabJson);
      statusDynamic.data = calculateModel;
    } else {
      eeee("kg bad:  url: $api  ,  response: ${response.data}");
    }
    return statusDynamic;
  }
}
