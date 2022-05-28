import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';

class OrderSelectRadioIndicator extends StatelessWidget {
  final bool? active;
  final double? w;
  final double? h;

  OrderSelectRadioIndicator({required this.active, this.h, this.w});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w ?? 22,
      height: h ?? 22,
      child: WidgetOrEmpty(
        value: active,
        child: Center(
          child: Container(
            width: w == null ? 20 : w! - 6,
            height: h == null ? 20 : h! - 6,
            decoration: BoxDecoration(
                color: MyColors.mainColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: MyColors.white)),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              width: 2,
              color: active! ? MyColors.mainColor : MyColors.mainColor)),
    );
  }
}
