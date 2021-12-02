import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorfullBackImage extends StatelessWidget {
  String? path;
  double? w;
  double? h;

  ColorfullBackImage({required this.path});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: w ?? 375.sp, // MediaQuery.of(context).size.width,
          height: h ?? 375.sp, //MediaQuery.of(context).size.height / 2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.pngColorfulBack),
            ),
          ),
        ),
        Positioned(
          top: 65,
          left: 65,
          right: 65,
          child: SizedBox(
            child: Image.asset(
              path!,
            ),
          ),
        ),
      ],
    );
  }
}
