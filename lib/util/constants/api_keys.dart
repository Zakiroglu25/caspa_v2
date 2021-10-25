// Flutter imports:
import 'package:flutter/foundation.dart';

class ApiKeys {
  ApiKeys._();

  static const baseUrl = 'https://optimal.inloya.com/api';
  static const headers = {
    "Content-Type": "application/json",
  };

  //reg and login
  static final login = "$baseUrl/Account/Login?phonenumber";

  //------------------local-------------------------
  static const youtubeIMG = "https://img.youtube.com/";
  static const youtube = "https://youtube.com/";
  static const vi = "vi/";
  static const defaultJPG = "/hqdefault.jpg";
  static const watch = "/watch?v=";

 // vi96JAj3ffdIw/default.jpg
}
