// Flutter imports:
import 'dart:io';

import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../formatter/masked_text_controller_phone.dart';

class StringOperations {
  //youtube
  static String idToIMG(String id) {
    String url = ApiKeys.youtubeIMG + ApiKeys.vi + id + ApiKeys.defaultJPG;
    //url="https://img.youtube.com/vi/S8441D2KpUU/hqdefault.jpg";
    return url;
  }

  static String idToURL(String id) {
    String url = ApiKeys.youtube + ApiKeys.watch + id;

    print("url: " + url);
    return url;
  }

  static copy(String? data, BuildContext context, {String? copyText}) {
    Clipboard.setData(ClipboardData(text: data ?? "")).then((_) {
      Snack.display(
          context: context,
          message: copyText ?? MyText.coppied,
          showSuccessIcon: true,
          positive: true);
    });
  }

  static String dateConvert(DateTime date) {
    // 2022-03-09T11:53:45.000000Z;
    var now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (DateFormat('dd.MM.yyyy').format(today).toString() ==
        DateFormat('dd.MM.yyyy').format(date).toString()) {
      return MyText.today;
    } else if (DateFormat('dd.MM.yyyy').format(yesterday).toString() ==
        DateFormat('dd.MM.yyyy').format(date).toString()) {
      return MyText.yesterday;
    } else {
      return DateFormat('dd.MM.yyyy').format(date).toString();
    }
  }

  static String dateConvertFromString(String datex,
      {bool smartDay = true, bool format = true}) {
    // 2022-03-09T11:53:45.000000Z;
    DateFormat finalFormat = DateFormat('dd.MM.yyyy');
    DateFormat givenFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    DateTime date;

    //in start date can be already formmatted , then we must not format it
    //with givenFormat format , we must save it
    if (format) {
      date = givenFormat.parse(datex);
    } else {
      date = finalFormat.parse(datex);
    }

    //if smart day is true thenn today,yesterday showing instead of date
    if (smartDay) {
      var now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

      if (finalFormat.format(today).toString() ==
          finalFormat.format(date).toString()) {
        return MyText.today;
      } else if (finalFormat.format(yesterday).toString() ==
          finalFormat.format(date).toString()) {
        return MyText.yesterday;
      } else {
        //else return formatted normal date
        return finalFormat.format(date).toString();
      }
    } else {
      //else return formatted normal date
      return finalFormat.format(date).toString();
    }
  }

  static DateTime formattedStringToDatetime(String datex) {
    // 2022-03-09T11:53:45.000000Z;
    DateTime date = DateFormat('dd.MM.yyyy').parse(datex);
    return date;
  }

  static List<int> stringListToIntList(String listAsString) {
    List<int>? dataListAsInt;
    try {
      dataListAsInt =
          listAsString.split(',').map((data) => int.parse(data)).toList();
    } catch (e) {
      print("stringListToIntList error: " + e.toString());
    }
    return dataListAsInt!;
  }

  static int platformId() {
    if (Platform.isAndroid) {
      return 1;
    } else if (Platform.isIOS) {
      return 2;
    } else {
      return 1;
    }
  }

  static Future<String> devicename() async {
    String deviceName;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo =
          await DeviceInfoPlugin().androidInfo;
      deviceName =
          '${androidDeviceInfo.brand!} ${androidDeviceInfo.model!} | Android: ${androidDeviceInfo.version.release}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
      deviceName =
          '${iosDeviceInfo.name!} | iOS: ${iosDeviceInfo.systemVersion}';
    } else {
      deviceName = 'unknown device';
    }
    return deviceName;
  }

  static bool urlIsValid(str) {
    return Uri.tryParse(str)?.hasAbsolutePath ?? false;
    ;
  }

  static TextEditingController stringToController(String? string) {
    return TextEditingController.fromValue(
        TextEditingValue(text: (string) ?? ""));
  }

  static TextEditingController stringToControllerPhone(String? string) {
    return MaskedTextController.app(text: (string) ?? "");
  }

  static String idSerieFromFullId(String string) {
    bbbb("hoh: " + idNumberFromFullId(string));

    if (string.substring(0, 3) == MyText.aze) {
      return MyText.aze;
    } else {
      return MyText.aa;
    }
  }

  static String idNumberFromFullId(String string) {
    if (string.substring(0, 3) == MyText.aze) {
      return string.substring(3);
    } else {
      return string.substring(2);
    }
  }

  static String dateToHours(String string) {
    return string.substring(10, string.length);
  }

  static launchCaller(String num) async {
    var url = "tel:$num".replaceAll(" ", " ");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
