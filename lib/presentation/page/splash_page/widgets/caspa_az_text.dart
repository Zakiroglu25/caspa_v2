import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaspaAzText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50.sp,
      child: FadeIn(
        child: Text(
          "www.caspa.az",
          style: AppTextStyles.coHead400.copyWith(color: MyColors.white),
        ),
      ),
    );
  }
}
