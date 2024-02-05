import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultCalculate extends StatelessWidget {
  ResultCalculate({Key? key, required this.result}) : super(key: key);

  String result;

  @override
  Widget build(BuildContext context) {
    double azn = double.parse(result.toString());
    double convertAzn = azn * 1.7;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(convertAzn.toStringAsFixed(2) + " AZN",
            style: AppTextStyles.coHead400.copyWith(fontSize: 25.sp)),
        Text(
          "\$" + " " + "$result",
          style: AppTextStyles.coHead400.copyWith(fontSize: 25.sp),
        ),
      ],
    );
  }
}
