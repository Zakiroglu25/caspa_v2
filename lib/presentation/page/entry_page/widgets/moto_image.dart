import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MotoImage extends StatelessWidget {
  const MotoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         SizedBox(
      width:SizeConfig.safeBlockHorizontal! * 200,
      height: SizeConfig.safeBlockVertical! *50,
      child: Center(
        child: Image.asset(
          Assets.pngMoto,
          width: 210.sp,
          height: 210.sp,
        ),
      ),
    );
  }
}
