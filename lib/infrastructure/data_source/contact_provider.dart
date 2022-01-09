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

class ContactProvider {
  static Future<List<Contact>?> getContact() async {
    List<Contact>? contactList;
    final api = ApiKeys.contact;
    final headers = ApiKeys.headers;
    var url = Uri.parse(api);
    llll(api);
    log("provider 1");
    final response = await http.get(url, headers: headers);
    log("provider 2");

    if (response.statusCode == ResultKey.successCode) {
      log("provider 3" + response.statusCode.toString());
      log("provider 3" + response.body.toString());
      List<Contact> orderModels = [];
      for (var e in (json.decode(response.body) as List)) {
        final c = Contact.fromJson(e);
        orderModels.add(c);
      }
      return orderModels;
    } else {
      eeee("bad url :$url,response: $response".toString());
    }
    return contactList;
  }
}
