import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfilePhoto extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return         Container(
        height: 100.sp,
        width: 100.sp,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(100.sp)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100.sp),
            child: CachedNetworkImage(fit: BoxFit.cover,
                imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png')));
  }
}
