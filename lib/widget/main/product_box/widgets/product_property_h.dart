import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPropertyH extends StatelessWidget {
  String? name;
  dynamic? value;
  double? h;


  ProductPropertyH({required this.name,required this.value,this.h});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 16.sm),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical:  h??4),
        child: Wrap(
          children: [
            Text(
              name! + ": ",
              style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
            ),

            Text(
              "$value",
              style: AppTextStyles.sanF400.copyWith(color: MyColors.black),
            )
          ],
        ),
      ),
    );
  }
}
