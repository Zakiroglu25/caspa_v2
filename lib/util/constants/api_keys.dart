// Flutter imports:
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/foundation.dart';

class ApiKeys {
  ApiKeys._();

  static const baseUrl = 'https://caspa.az/api';
  static const headers = {
    "Content-Type": "application/json",
    "Accept":"application/json",
  };

  //reg and login
  static final login = "/user/login";
  static final register = "/user/register";

  //------------------local-------------------------
  static const youtubeIMG = "https://img.youtube.com/";
  static const youtube = "https://youtube.com/";
  static const vi = "vi/";
  static const defaultJPG = "/hqdefault.jpg";
  static const watch = "/watch?v=";

  //get tarif
  static const getTarif = "$baseUrl/public/prices";
 // vi96JAj3ffdIw/default.jpg


  static loginBody({
    String? email,
    String? password,
    String? device_name,

  }) {
    //
    final map = {
      "email":"esev.sv@gmail.com",
      "password":"salam12345",
      "device_name":"addd",
      "deviceName":"addd"
    };

    aaaa(map.toString());
    map.removeWhere(
            (key, value) => key == null || value == null || value == 'null');
    return map;
  }


  static registrationBody({
    required String? name,
    required String? surname,
    required String? address,
    required String? email,
    required String? password,
    required String? password_confirmation,
    required String? phone,
    required String? accept,
    required String? company_name,
    required String? tax_number,

  }) {
    //
    final map = {
      "name":"esev.sv@gmail.com",
      "surname":"salam12345",
      "address":"addd",
      "email":"addd",
      "password":"addd",
      "password_confirmation ":"addd",
      "phone":"addd",
      "accept":"addd",
      "company_name":"addd",
      "tax_number":"addd"
    };

    aaaa(map.toString());
    map.removeWhere(
            (key, value) => key == null || value == null || value == 'null');
    return map;
  }


}
