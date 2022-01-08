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
  static Future<Contact> getContact() async {
    Contact contact = Contact();
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
      var gelenCavabJson = jsonDecode(response.body);
      log("provider 4" + gelenCavabJson);
      Contact contacts = Contact.fromJson(gelenCavabJson);
      contact = contacts;
      log("provider 5"+gelenCavabJson);
      bbbb("st: " + (contacts).toString());
    } else {
      log("provider 6");
      eeee("getCategory bad url :$url,response: ${response}");
    }

    return contact;
  }
}
