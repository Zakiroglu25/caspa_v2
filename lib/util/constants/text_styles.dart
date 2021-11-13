import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class UITextStyle {
  UITextStyle._();

  //section Name
  static const tW600Black = TextStyle(
      color: MyColors.textBlack,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'San Francisco');

  static const tW400Grey = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: MyColors.grey153,
      fontFamily: 'San Francisco');

  static const tW400BigBlack = TextStyle(
      fontSize: 25,
      fontFamily: 'Co Headline',
      fontWeight: FontWeight.w400,
      color: MyColors.textBlack);
}
