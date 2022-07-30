// Flutter imports:
import 'dart:math' as math;

import 'package:flutter/material.dart';

class Rndm {
  //soft colors
  static Color get color =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(.15);
}
