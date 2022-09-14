import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalansMiniBox extends StatelessWidget {
  final Function? onTap;
  final Color? color;
  final Color? priceColor;
  final String? title;
  final String? content;
  final String? finishTime;
  final Widget icon;
  final double? h;
  final double? w;

  BalansMiniBox(
      {this.onTap,
      this.finishTime,
      this.color,
      required this.icon,
      this.priceColor,
      required this.title,
      required this.content,
      this.h,
      this.w});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => onTap?.call(),
      child: Container(
        width: w ?? (MediaQuery.of(context).size.width - 32 - 16) / 2,
        height: h ?? 96,
        decoration: BoxDecoration(
            color: color ?? MyColors.shop,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: Paddings.paddingA16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title!,
                      style: AppTextStyles.sanF400.copyWith(fontSize: 14.sp)),
                  icon,
                ],
              ),
              //MySizedBox.h6,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    content!,
                    style: AppTextStyles.sanF600
                        .copyWith(fontSize: 16.sp, color: priceColor!),
                  ),
                  Text(
                    finishTime!,
                    style: AppTextStyles.sanF600
                        .copyWith(fontSize: 16.sp, color: priceColor!),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
