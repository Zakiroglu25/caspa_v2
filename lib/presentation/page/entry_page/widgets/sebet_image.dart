import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SebetImage extends StatelessWidget {
  const SebetImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         SizedBox(
      width:SizeConfig.safeBlockHorizontal! * 200,
      height: SizeConfig.safeBlockVertical! *50,
      child: Center(
        child: Image.asset(
          Assets.pngSebet,
          width: 210.sp,
          height: 210.sp,
        ),
      ),
    );
  }
}
