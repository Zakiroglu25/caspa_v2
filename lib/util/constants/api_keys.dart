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

  //------------------local-------------------------
  static const youtubeIMG = "https://img.youtube.com/";
  static const youtube = "https://youtube.com/";
  static const vi = "vi/";
  static const defaultJPG = "/hqdefault.jpg";
  static const watch = "/watch?v=";

  //get tarif
  static const getTarif = "$baseUrl/public/prices";
 // vi96JAj3ffdIw/default.jpg


  static loginApproveBody({
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

}
