import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class ForgotSecondText extends StatelessWidget {

  String text;

  ForgotSecondText(this.text);

  @override
  Widget build(BuildContext context) {
    return           Text(
     text,
      textAlign: TextAlign.center,
      style: AppTextStyles.sanF400
          .copyWith(fontSize: 14, color: MyColors.grey165),
    );
  }
}
