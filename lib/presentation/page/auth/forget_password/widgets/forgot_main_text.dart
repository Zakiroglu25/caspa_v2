import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

class ForgotMainText extends StatelessWidget {
  String text;

  ForgotMainText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.coHead400.copyWith(fontSize: 25),
    );
  }
}
