import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/locator.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

class TarifProvider {
  static HiveService get _prefs => locator<HiveService>();

  static Future<TariffData> getTarif() async {
    late TariffData priceModel;
    final api = ApiKeys.tariff;

    final response = await dioG.dio.get(api);
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      priceModel = TariffData.fromJson(gelenCavabJson);
    } else {
      eeee("bad url :$api ,response: ${response}");
    }
    return priceModel;
  }
}
