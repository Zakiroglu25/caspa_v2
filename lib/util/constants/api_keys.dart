// Flutter imports:
import 'package:flutter/foundation.dart';

class ApiKeys {
  ApiKeys._();

  static const baseUrl = 'https://caspa.az/api';
  static const headers = {
    "Content-Type": "application/json",
  };

  //reg and login
  static final login = "/user/login";

  //------------------local-------------------------
  static const youtubeIMG = "https://img.youtube.com/";
  static const youtube = "https://youtube.com/";
  static const vi = "vi/";
  static const defaultJPG = "/hqdefault.jpg";
  static const watch = "/watch?v=";

 // vi96JAj3ffdIw/default.jpg


  static loginApproveBody({
    String? email,
    String? password,
    String? device_name,

  }) {
    //
    final map = {
      "email": email,
      "customerGuid": password,
      "device_name": device_name,
    };
    map.removeWhere(
            (key, value) => key == null || value == null || value == 'null');
    return map;
  }

}
