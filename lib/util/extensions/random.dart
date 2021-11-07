// Flutter imports:
import 'dart:io';
import 'package:caspa_v2/util/constants/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

extension Rndm on Color{
  //soft colors
  Color get random=> Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(.15);
}
