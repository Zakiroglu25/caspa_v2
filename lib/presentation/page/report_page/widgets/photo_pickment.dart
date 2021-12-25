import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoPickment extends StatelessWidget {
  const PhotoPickment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 120.sp,
        height: 120.sp,
        decoration: BoxDecoration(
          color: MyColors.mainGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(Icons.camera),
        ),
      ),
    );
  }
}
