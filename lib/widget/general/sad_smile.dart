import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/constants/app_text_styles.dart';
import '../../util/constants/colors.dart';

class SadSmile extends StatelessWidget {
  final double? w;
  final double? h;

  SadSmile({this.w, this.h});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: h ?? 120.sp,
              width: w ?? 120.sp,
              child: Image.asset('assets/png/sad.png')),
          MySizedBox.h16,
          Text(
            "Bura boşdur",
            style: AppTextStyles.coHead400.copyWith(fontSize: 20),
          ),
          MySizedBox.h16,
          Text(
            "Hörmətli müştəri, Caspa-nın kampaniyalarında iştirak etmədiyiniz üçün bonus balansınız boşdur.",
            textAlign: TextAlign.center,
            style: AppTextStyles.sanF400
                .copyWith(fontSize: 12.sp, color: MyColors.grey153),

          ),
        ],
      ),
    );
  }
}
