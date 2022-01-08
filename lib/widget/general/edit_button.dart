import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditButton extends StatelessWidget {

final Function? onTap;
final double? w;
final double? h;


EditButton({required this.onTap, this.w, this.h});

  @override
  Widget build(BuildContext context) {
    return             InkWrapper(
      onTap: ()=>onTap?.call(),
      child: Container(
        width: w??40.sp,
        height: h?? 40.sp,
        decoration: BoxDecoration(
          color: MyColors.grey245,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SizedBox(
              width: 24.sp,
              height: 24.sp,
              child: SvgPicture.asset(Assets.svgEdit)),
        ),
      ),
    );
  }
}
