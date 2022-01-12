import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftTableTitle extends StatelessWidget {
  const GiftTableTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          MyText.code,
          style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
        ),
        Spacer(),
        Text(
          MyText.date,
          style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
        ),
        Spacer(),
        Text(
          MyText.value,
          style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
        ),
      ],
    );
  }
}
