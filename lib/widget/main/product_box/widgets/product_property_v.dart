import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'indicator.dart';

class ProductPropertyV extends StatelessWidget {
  final String? name;
  final dynamic? value;
  final double? h;

  final int? statusId;

  ProductPropertyV(
      {required this.name, required this.value, this.h, this.statusId});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 16.sm),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: h ?? 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name! + ": ",
              style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
            ),
            Row(
              children: [
                PropertyIndicator(statusId),
                Text(
                  "$value",
                  style: AppTextStyles.sanF400.copyWith(color: MyColors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}