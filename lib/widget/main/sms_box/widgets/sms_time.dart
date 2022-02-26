import 'package:flutter/material.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';

class SmsTime extends StatelessWidget {
  const SmsTime({Key? key, required this.time}) : super(key: key);
  final String time;
  @override
  Widget build(BuildContext context) {
    return Text(
      "Trendyol. Vaxt: $time",
      style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
    );
  }
}
