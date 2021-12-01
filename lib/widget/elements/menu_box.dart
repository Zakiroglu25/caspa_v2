import 'package:caspa_v2/presentation/page/new_order_link_page/link_tab.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
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
    return InkWrapper(
      onTap: () => onTap?.call(),
      child: Container(
        width: w ?? 167.sp,
        height: h ?? 140.sp,
        decoration: BoxDecoration(
            color: color ?? MyColors.mainColor,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!,
                  style: AppTextStyles.sanF400.copyWith(fontSize: 16)),
              MySizedBox.h4,
              Text(
                content!,
                style: AppTextStyles.sanF400
                    .copyWith(fontSize: 12, color: MyColors.grey153),
              )
            ],
          ),
        ),
      ),
    );
  }
}
