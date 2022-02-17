import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'indicator.dart';

class ProductPropertyV extends StatelessWidget {
  final String? name;
  final dynamic value;
  final double? h;
  final Color? mainColor;
  final Color? titleColor;
  final Function? onTap;

  final int? statusId;

  ProductPropertyV(
      {required this.name,
      required this.value,
      this.h,
      this.onTap,
      this.statusId,
      this.mainColor,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 16.sm),
      child: GestureDetector(
        onTap: () => onTap?.call(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: h ?? 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name! + ": ",
                style: AppTextStyles.sanF400.copyWith(
                  color: titleColor ?? MyColors.grey153,
                  fontSize: 14.sm,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              MySizedBox.h2,
              Row(
                children: [
                  PropertyIndicator(statusId),
                  Flexible(
                    child: Text(
                      "$value",
                      style: AppTextStyles.sanF400
                          .copyWith(color: mainColor ?? MyColors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
