// Flutter imports:
import 'dart:io';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

class Rndm {
  //soft colors
 static Color get color=> Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(.15);
}
