import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialItem extends StatelessWidget {
  final String? name;
  final String? path;
  final Function ? onTap;

  SocialItem({required this.name, required this.path, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: ()=>bbbb("a"),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color.fromRGBO(85, 169, 50, 0.1),
            child: SvgPicture.asset(path!),
          ),
          MySizedBox.w12,
          Text(
            name!,
            style: AppTextStyles.sanF600.copyWith(fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
