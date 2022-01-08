import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingElement extends StatelessWidget {
  final Function onTap;
  final String title;
  final String svgPath;

  SettingElement(
      {required this.onTap, required this.title, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => onTap.call(),
      child: Row(
        children: [
          SvgPicture.asset(svgPath),
          MySizedBox.w20,
          Text(
            title,
            style: AppTextStyles.sanF400
                .copyWith(color: Colors.black, fontSize: 17.sp),
          ),
        ],
      ),
    );
  }
}
