// Flutter imports:
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';

class ApiKeys {
  ApiKeys._();

  static const baseUrl = 'https://caspa.az/api';
  ///delete
  static const baseUrlTest = 'https://demoapi.rahatapp.az/v1';
  static const headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  //reg and login
  static final login = "$baseUrl/user/login";
  static final registerPersonal = "$baseUrl/user/register";
  static final registerCompany = "$baseUrl/user/company/register";

  //user
  static final user = "$baseUrl/user/user";

  //general
  static final shop ='$baseUrl/public/stores';

  //------------------local-------------------------
  static const youtubeIMG = "https://img.youtube.com/";
  static const youtube = "https://youtube.com/";
  static const vi = "vi/";
  static const defaultJPG = "/hqdefault.jpg";
  static const watch = "/watch?v=";

  //get tarif
  static const getTarif = "$baseUrl/public/prices";

  //get address
  static const getAddress = "$baseUrl/public/countries";

  ///delete
  static const orderHistory = "$baseUrlTest/orders/histories";

  static loginBody({
    required String? email,
    required String? password,
    required String? device_name,
    required String? language,
    required int? deviceTypeId,
    required String? deviceCode,
  }) {
    //
    final map = {
      "email": email,
      "password": password,
      "device_name": device_name,
      "deviceName": device_name,
      "deviceTypeId": deviceTypeId,
      "deviceCode": deviceCode,
      "language": language,
    };

    aaaa(map.toString());
    map.removeWhere(
            (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static registrationBusinessBody({
    required String? name,
    required String? surname,
    required String? address,
    required String? email,
    required String? language,
    required String? deviceCode,
    required int? deviceTypeId,
    required String? password,
    required String? password_confirmation,
    required String? phone,
    required int? accept,
    required String? company_name,
    required String? tax_number,
  }) {
    //
    final map = {
      "name": name,
      "surname": surname,
      "address": address,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
      "phone": phone,
      "accept": 1,
      "company_name": company_name,
      "tax_number": tax_number,
      "deviceCode":deviceCode,
      "deviceTypeId":deviceTypeId,
      "language":language
    };

    aaaa(map.toString());
    map.removeWhere(
            (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static registrationPersonalBody({
    required String? name,
    required String? surname,
    required String? address,
    required String? language,
    required String? deviceCode,
    required int? deviceTypeId,
    required String? email,
    required String? password,
    required String? password_confirmation,
    required String? phone,
    required int? accept,
    required String? id_number,
    required String? fin,
    required String? birthday,
    required String? gender,
    required int? ware_house,
  }) {
    //
    // final map = {
    //   "name": "esev.sv@gmail.com",
    //   "surname": "salam12345",
    //   "address": "addd",
    //   "email": "addd",
    //   "password": "addd",
    //   "password_confirmation ": "addd",
    //   "phone": "addd",
    //   "accept": "addd",
    //   "id_number": "addd",
    //   "fin": "addd",
    //   "birthday": "addd",
    //   "gender": "addd",
    //   "ware_house": "addd",
    // };

  final map = {
      "name": name,
      "surname": surname,
      "address": address,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
      "phone": phone,
      "accept": 1,
      "id_number": id_number,
      "fin": fin,
      "birthday": birthday,
      "gender": gender,
      "ware_house": 1,
    "deviceCode":deviceCode,
    "deviceTypeId":deviceTypeId,
    "language":language
    };

    aaaa(map.toString());
    map.removeWhere(
            (key, value) => key == null || value == null || value == 'null');
    return map;
  }

  static header({
    required String? token,
  }) {
    //
    final map = {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/json",
    };

    aaaa(map.toString());
    map.removeWhere(
            (key, value) => key == null || value == null || value == 'null');
    return map;
  }
}