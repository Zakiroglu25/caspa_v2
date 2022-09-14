import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceBox extends StatelessWidget {
  final Function? onTap;
  final Color? color;
  final Color? colorbtn;

  final String? title;
  final String? subtitle;
  final String? btnText;
  final String? price;
  final double? h;

  final double? w;

  BalanceBox(
      {this.onTap,
      this.btnText,
      this.color,
      this.colorbtn,
      required this.title,
      required this.price,
      required this.subtitle,
      this.h,
      this.w});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => onTap?.call(),
      child: Container(
        width: w,
        height: h ?? 96,
        decoration: BoxDecoration(
            color: color ?? MyColors.mainColor,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: Paddings.paddingA16,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title!,
                      style: AppTextStyles.sanF400.copyWith(
                          fontSize: 14.sp, color: MyColors.textBlack)),
                  Text(subtitle!,
                      style: AppTextStyles.sanF400.copyWith(fontSize: 14.sp)),
                  MySizedBox.h6,
                  Text(
                    price!,
                    style: AppTextStyles.sanF600
                        .copyWith(fontSize: 16.sp, color: colorbtn!),
                  )
                ],
              ),
              Spacer(),
              CaspaButton(
                text: btnText!,
                w: 117.sm,
                h: 44.sm,
                textSize: 14.sm,
                color: colorbtn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
