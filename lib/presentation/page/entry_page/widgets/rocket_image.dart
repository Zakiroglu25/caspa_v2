import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RocketImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: SizeConfig.safeBlockHorizontal! * 200,
      height: SizeConfig.safeBlockVertical! * 50,
      child: Center(
        child: Image.asset(
          Assets.pngRocket,
          width: 210.sp,
          height: 210.sp,
        ),
      ),
    );
  }
}
