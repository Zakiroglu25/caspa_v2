import 'package:caspa_v2/presentation/page/new_order_link_page/link_tab.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalansMiniBox extends StatelessWidget {
  final Function? onTap;
  final Color? color;
  final Color? priceColor;
  final String? title;
  final String? content;
  final Widget icon;
  final double? h;
  final double? w;

  BalansMiniBox(
      {this.onTap,
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
        width: w ?? 163.sp,
        height: h ?? 96.sp,
        decoration: BoxDecoration(
            color: color ?? MyColors.shop,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title!,
                      style: AppTextStyles.sanF400.copyWith(fontSize: 12.sp)),
                  icon,
                ],
              ),
              MySizedBox.h6,
              Text(
                content!,
                style: AppTextStyles.sanF600
                    .copyWith(fontSize: 16.sp, color: priceColor!),
              )
            ],
          ),
        ),
      ),
    );
  }
}