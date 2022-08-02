import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class CaspaTextFieldUnder extends StatelessWidget {
  String? text;

  CaspaTextFieldUnder(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          color: MyColors.grey153, fontWeight: FontWeight.w400, fontSize: 14),
    );
  }
}
