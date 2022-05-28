import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';

class SuccesPaymentWidget extends StatelessWidget {
  const SuccesPaymentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      height: 24.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.black34),
      child: Center(
        child: Text(
          "Ödənilib",
          style: AppTextStyles.sanF400.copyWith(
              color: MyColors.white, fontSize: 12.sp),
        ),
      ),
    );
  }
}