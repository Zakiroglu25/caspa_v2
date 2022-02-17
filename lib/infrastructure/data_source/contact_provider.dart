import 'package:caspa_v2/infrastructure/models/remote/response/contact_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';

import '../../locator.dart';

class ContactProvider {
  static Future<StatusDynamic> fetchContacts() async {
    StatusDynamic statusDynamic = StatusDynamic();
    var api = ApiKeys.contact;
    final response = await dioG.dio.get(api);
    statusDynamic.statusCode = response.statusCode;
    if (response.statusCode == ResultKey.successCode) {
      final gelenCavabJson = response.data;
      Contacts contacts = Contacts.fromJson(gelenCavabJson);
      statusDynamic.data = contacts;
    } else {
      eeee("fetchPackagesForCourier bad url :$api,response: ${response}");
    }
    return statusDynamic;
  }
}
