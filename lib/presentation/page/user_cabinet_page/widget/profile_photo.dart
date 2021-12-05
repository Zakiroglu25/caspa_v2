import 'package:cached_network_image/cached_network_image.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePhoto extends StatelessWidget {
  final double? w;
  final double? h;
  final bool? editable;

  ProfilePhoto({this.w, this.h, this.editable});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: h ?? 100.sp,
            width: w ?? 100.sp,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(100.sp)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.sp),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png'))),
        Positioned(
          bottom: 0,right: 2,
          child: WidgetOrEmpty(
              value: (editable??false), child: Container(
            height: 36.sm,
              width: 36.sm,
             decoration: BoxDecoration(
               color: MyColors.mainColor,
               borderRadius: BorderRadius.circular(36.sm)
             ),
              padding: Paddings.paddingA4,
              child: Center(
                child: Container(

                    height: 20.sm,
                    width: 20.sm,

                    child: SvgPicture.asset(Assets.svgCamera)),
              ))),
        )
      ],
    );
  }
}
