import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuBox extends StatelessWidget {
  final Function? onTap;
  final Color? color;
  final String? title;
  final String? content;
  final double? h;
  final double? w;

  MenuBox(
      {this.onTap,
      this.color,
      required this.title,
      required this.content,
      this.h,
      this.w});

  @override
  Widget build(BuildContext context) {
    final boxW = (MediaQuery.of(context).size.width / 2) - 24;
    return InkWrapper(
      onTap: () => onTap?.call(),
      child: Container(
        width: w ?? boxW,
        height: h ?? 155.sp,
        decoration: BoxDecoration(
            color: color ?? MyColors.mainColor,
            borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: Paddings.paddingA20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!,
                  style: AppTextStyles.sanF600.copyWith(fontSize: 17.sm)),
              MySizedBox.h4,
              Text(
                content!,
                style: AppTextStyles.sanF400.copyWith(
                    fontSize: 11.sm,
                    color: MyColors.grey153,
                    height: 1.3,
                    letterSpacing: 0.2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
