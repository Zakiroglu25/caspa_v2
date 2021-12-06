import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         Text(
      "Baxtiyar Zakiroglu ",
      textAlign: TextAlign.center,
      style: AppTextStyles.coHead400.copyWith(
        fontSize: 25.sm,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
