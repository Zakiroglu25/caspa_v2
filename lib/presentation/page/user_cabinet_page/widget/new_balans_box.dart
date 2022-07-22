import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewBalanceBox extends StatelessWidget {
  final Function? onTap;
  final Color? color;
  final String? icon;
  final String? boxTitle;
  final String? title;
  final String? subtitle;
  final Color? subtitleColor;
  final String? desc;
  final double? h;

  final double? w;

  NewBalanceBox(
      {this.onTap,
      this.color,
      required this.title,
      required this.subtitle,
      this.h,
      this.w,
      this.icon,
      this.boxTitle,
      this.desc,
      this.subtitleColor});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => onTap?.call(),
      child: Row(
        children: [
          Container(
            width: w ?? 102,
            height: h ?? 102,
            decoration: BoxDecoration(
                color: color ?? MyColors.mainColor,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: Paddings.paddingA16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 24, height: 24, child: Image.asset(icon!)),
                  MySizedBox.h8,
                  Text(
                    boxTitle!,
                    style: AppTextStyles.coHead400,
                  ),
                ],
              ),
            ),
          ),
          MySizedBox.w16,
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title!,
                    style: AppTextStyles.sanF600
                        .copyWith(fontSize: 14.sp, color: MyColors.black34)),
                MySizedBox.h4,
                Text(subtitle!,
                    style: AppTextStyles.sanF600
                        .copyWith(fontSize: 14.sp, color: subtitleColor!)),
                MySizedBox.h4,
                Text(
                  desc!,
                  style: AppTextStyles.sanF400
                      .copyWith(fontSize: 12.sp, color: MyColors.grey153),
                ),
              ],
            ),
          ),
          MySizedBox.w8
        ],
      ),
    );
  }
}
