// Flutter imports:
import 'dart:convert';
import 'dart:io';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppOperations {


  static int getTime(index) {
    return (index * 100) < 1500 ? index * 100 : 400;
  }

  static String formatNumber(String num) {
    final a = num.replaceAll('(', "(0");

    return a.replaceAll(' ', "-");
  }

  static bool idCardSeriesControl(String id) {
    if (id!=null && id.length>=3) {
      if (isNumeric( id[2])) {
        return id.length == 9;
      }
      // else if (num[1] == 'Z') {
      //   return num.length == 11;
      // }
      else
        return id.length==11;
    }  else return false;
  }


  /// check if the string contains only numbers
  static bool isNumeric(String str) {
    return RegExp(r'^-?[0-9]+$').hasMatch(str);
  }



    static List<String> errorFromListOfListAsList(String body) {
      List<String> esilErrorList=<String>[];
      List errorList=((jsonDecode(body) as Map)['errors']);
      errorList.forEach((e) {
        esilErrorList.add(e[0]);
      });

      return esilErrorList;
  }




}
