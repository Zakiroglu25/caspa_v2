import 'dart:convert';
import 'dart:developer';

import 'package:caspa_v2/infrastructure/models/remote/response/categories_response.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/contact_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/status_dynamic.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/result_keys.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:http/http.dart' as http;

import 'tarif_provider.dart';

class ContactProvider {
  static Future<Contact?> getContact() async {
    Contact? contactModel;
    final api = ApiKeys.contact;
    var url = Uri.parse(api);
    llll(api);
    final response = await dioAuth.dio.get(api);
    if (response.statusCode == ResultKey.successCode) {
      final gelenDataJson = response.data;
      contactModel= Contact.fromJson(gelenDataJson);

    } else {
      eeee("bad url :$url,response: $response".toString());
    }
    return contactModel;
  }
}
