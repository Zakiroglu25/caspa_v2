import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SadSmile extends StatelessWidget {
  final double? w;
  final double? h;

  SadSmile({this.w, this.h});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: h ?? 120.sp,
        width: w ?? 120.sp,
        child: Image.asset('assets/png/sad.png'));
  }
}
