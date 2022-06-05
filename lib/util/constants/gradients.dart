import 'package:flutter/material.dart';

import 'colors.dart';

class Gradients {
  Gradients._();

  static LinearGradient gBlues = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        // Color.fromRGBO(105, 145, 244, 1),
        Color.fromRGBO(78, 167, 244, 1),
        Color.fromRGBO(89, 193, 228, 1),
      ]);

  static LinearGradient gGreens = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(23, 187, 158, 1),
        Color.fromRGBO(36, 227, 194, 1),
      ]);

  static LinearGradient gReds = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(248, 20, 80, 1),
        Color.fromRGBO(248, 90, 80, 1),
        // Color.fromRGBO(248, 102, 170, 1),
      ]);

  static LinearGradient unicorn = LinearGradient(colors: [
    MyColors.gradientBlue,
    MyColors.gradientCyan,
    MyColors.gradientRed,
    MyColors.gradientOrange,
  ]);
}
