// Flutter imports:
import 'dart:math' as math;

import 'package:flutter/material.dart';

extension Rndm on Color {
  //soft colors
  Color get random =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(.15);
}
