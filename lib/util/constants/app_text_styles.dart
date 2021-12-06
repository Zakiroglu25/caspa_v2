import 'package:flutter/widgets.dart';

import 'colors.dart';

abstract class AppTextStyles {
  static const coHead600 = TextStyle(
    fontFamily: 'Co Headline',
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
  static const coHead700 = TextStyle(
    fontFamily: 'Co Headline',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static const coHead500 = TextStyle(
    fontFamily: 'Co Headline',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static const coHead400 = TextStyle(
    fontFamily: 'Co Headline',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );



  static const sanF400 = TextStyle(
    fontFamily: 'San Francisco',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static const sanF400Grey = TextStyle(
    fontFamily: 'San Francisco',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: MyColors.grey153
  );

  static const sanF500 = TextStyle(
    fontFamily: 'San Francisco',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,

  ); static const sanF600 = TextStyle(
    fontFamily: 'San Francisco',
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
}