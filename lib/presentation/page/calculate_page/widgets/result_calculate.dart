import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultCalculate extends StatelessWidget {
  ResultCalculate({Key? key, required this.result}) : super(key: key);

  double result;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$" + " " + "$result",
          style: AppTextStyles.coHead400.copyWith(fontSize: 25.sp),
        ),
      ],
    );
  }
}
