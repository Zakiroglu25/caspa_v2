import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

class CongratsText extends StatelessWidget {
  const CongratsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      MyText.congrats,
      style: AppTextStyles.coHead400.copyWith(fontSize: 25),
    );
  }
}
