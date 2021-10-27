import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/formatter/lower_case_formatter.dart';
import 'package:caspa_v2/util/formatter/upper_case_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaspaTextFieldUnder extends StatelessWidget {
  String? text;

  CaspaTextFieldUnder(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,bottom: 4,top: 16),
      child: Text(
        "$text",
        style: TextStyle(color: MyColors.textFieldLittleText,fontWeight: FontWeight.w400,fontSize: 14),
      ),
    );
  }
}
