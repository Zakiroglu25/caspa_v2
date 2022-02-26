import 'package:flutter/material.dart';

import '../../../../util/constants/app_text_styles.dart';

class SmsCode extends StatelessWidget {
  const SmsCode({Key? key, required this.code}) : super(key: key);
  final String code;
  @override
  Widget build(BuildContext context) {
    return Text(
      code,
      style: AppTextStyles.sanF400,
    );
  }
}
