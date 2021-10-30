// Flutter imports:
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printTime: false,
  ),
);

class MyPrinter {
  static void debug({url, body, response}) {
    if (url != null) {
      debugPrint("URL -> $url");
    }

    if (body != null) {
      debugPrint("BODY -> $body");
    }
  }

  static void token({token}) {
    if (token != null) {
      debugPrint("TOKEN -> $token");
    }
  }
}

void aaaa(dynamic a) {
  debugPrint("sprint: $a");
}

void bbbb(dynamic a) {
  debugPrint("$a");
}

void eeee(String a) {
  logger.e(a);
}

void dddd(String a) {
  logger.d(a);
}

void vvvv(String a) {
  logger.v(a);
}

void llll(String a, {bool? printApi}) {
  (printApi ?? true) ? logger.v(a) : null;
}

void wwwww(String a) {
  logger.w(a);
}

void wtf(String a) {
  logger.wtf(a);
}

void iiii(String a) {
  logger.i(a);
}
