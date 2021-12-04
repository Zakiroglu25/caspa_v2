import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CabinetHeaderWidget extends StatelessWidget {
  const CabinetHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 64,
          child: Image.asset(Assets.pngMoto),
          backgroundColor: MyColors.grey153,
        ),
        MySizedBox.h16,
        Align(
          alignment: Alignment.center,
          child: Text(
            "Baxtiyar Zakiroglu",
            style: AppTextStyles.coHead400.copyWith(
              fontSize: 25.sp,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        MySizedBox.h16,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID:" + "C11111",
              style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
            ),
            //Text("C11111"),
            MySizedBox.w16,
            SvgPicture.asset(
              Assets.svgCopy,
              color: MyColors.grey153,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            MyText.userCabinet,
            textAlign: TextAlign.center,
            style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153,fontSize: 16),
          ),
        ),
      ],
    );
  }
}
