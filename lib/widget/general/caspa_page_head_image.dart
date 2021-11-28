import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaspaPageHeadImage extends StatelessWidget {
String path;


CaspaPageHeadImage(this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 305.sp,
      width: 305.sp,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            //   width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height / 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.pngColorfulBack),
              ),
            ),
          ),
          SizedBox(
            child: Image.asset(
             path,
            ),
          ),
        ],
      ),
    );
  }
}
