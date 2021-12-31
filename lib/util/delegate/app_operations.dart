// Flutter imports:
import 'dart:convert';
import 'dart:io';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
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
    if (id != null && id.length >= 3) {
      if (isNumeric(id[2])) {
        return id.length == 9;
      }
      // else if (num[1] == 'Z') {
      //   return num.length == 11;
      // }
      else
        return id.length == 11;
    } else
      return false;
  }

  /// check if the string contains only numbers
  static bool isNumeric(String str) {
    return RegExp(r'^-?[0-9]+$').hasMatch(str);
  }

  static List<String> errorFromListOfListAsList(String body) {
    List<String> esilErrorList = <String>[];
    List errorList = ((jsonDecode(body) as Map)['errors']);
    errorList.forEach((e) {
      esilErrorList.add(e[0]);
    });

    return esilErrorList;
  }

  static Color colorWithId(int id) {
    int r = (id / 10).toInt();
    if (r > 256) {
      r = r - 256;
    } // 128 ... 255
    int g = deleteDigitOfInt(id, 1,r);

    int b = deleteDigitOfInt(id, 2,r);
    //bbbb("id::LL  :: " + id.toString());

    //bbbb("icolor:  $r  $g  $b " + id.toString());
    return Color.fromRGBO(r, g, b, 0.1);
  }

  static deleteDigitOfInt(int num, int which, int r) {
    // int checksum=0;
    int newNumInt;
    try {
      String numString = num.toString();
      //int l= numString.length();

      String newNumString = numString.substring(which);

      newNumString =
          numString[numString.length - 1] + newNumString + numString[which];
      newNumString = newNumString.substring(0, 2);
      newNumInt = int.parse(newNumString);
      newNumInt=newNumInt*num.floor();
      newNumInt =r-newNumInt;
    } catch (e) {
      newNumInt = int.parse((num.toString()).split('').reversed.join(''));
    }

    return newNumInt;
  }
}
