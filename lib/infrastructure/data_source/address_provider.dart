import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';
import '../configs/dio_general.dart';

class AddressProvider {
  static DioG get dioAuth => locator<DioG>();
  static Future<AddressList> getAddress() async {
    late AddressList addressModel;
    const api = ApiKeys.getAddress;
    final response = await dioG.dio.get(api);
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = (response.data);
      addressModel = AddressList.fromJson(gelenCavabJson);
    } else {
      eeee("bad url :$api ,response: $response");
    }
    return addressModel;
  }
}
