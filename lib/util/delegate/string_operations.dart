// Flutter imports:
import 'dart:io';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StringOperations {

  //youtube
  static String idToIMG(String id) {
    String url = ApiKeys.youtubeIMG+ApiKeys.vi + id + ApiKeys.defaultJPG;
    //url="https://img.youtube.com/vi/S8441D2KpUU/hqdefault.jpg";
    return url;
  }
  static String idToURL(String id) {
    String url =ApiKeys.youtube+ ApiKeys.watch + id;

    print("url: "+url);
    return url;
  }
}
