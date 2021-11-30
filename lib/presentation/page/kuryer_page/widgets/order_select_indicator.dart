import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';

class OrderSelectIndicator extends StatelessWidget {
  final bool? active;

  OrderSelectIndicator({required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      child: WidgetOrEmpty(
        value: active,
        child: Center(
          child: Container(
            width: 16,
            height: 16,
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
              color:
                  active! ? MyColors.mainColor : MyColors.greyPassiveContent)),
    );
  }
}
