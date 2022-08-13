import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/constants/text_styles.dart';

class CourierInfoBox extends StatelessWidget {
  const CourierInfoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MyColors.mainOpacity,
      ),
      child: Stack(
        children: [
          Padding(
            padding: Paddings.paddingA16 + EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Diqqət!",
                  style: UITextStyle.tW600Black
                      .copyWith(fontSize: 14, letterSpacing: 0.3),
                ),
                MySizedBox.h4,
                Text(
                  MyText.courierInfoTime,
                  style: AppTextStyles.sanF400.copyWith(
                      fontSize: 14, letterSpacing: 0.3, color: MyColors.dark51),
                )
              ],
            ),
          ),
          Positioned(
            right: 12,
            top: 12,
            child: Container(
                width: 22,
                height: 22,
                child: SvgPicture.asset(Assets.svgInfoCourier)),
          )
        ],
      ),
    );
  }
}
