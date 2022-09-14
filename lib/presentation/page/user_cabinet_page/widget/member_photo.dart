import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/constants/assets.dart';
import '../../../../util/screen/errorable_image.dart';
import '../../../../util/screen/widget_or_empty.dart';

class MemberPhoto extends StatelessWidget {
  const MemberPhoto({
    Key? key,
    this.h,
    this.w,
    this.url,
  }) : super(key: key);

  final double? h;
  final double? w;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: h ?? 100.sp,
        width: w ?? 100.sp,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.sp)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100.sp),
            child: WidgetOrEmpty(
                value: url == null,
                child: Container(
                    height: h ?? 100.sp,
                    width: w ?? 100.sp,
                    child: SvgPicture.asset(Assets.svgUserCircle)),
                elseChild: ErrorableImage(fit: BoxFit.cover, url: url))));
  }
}
