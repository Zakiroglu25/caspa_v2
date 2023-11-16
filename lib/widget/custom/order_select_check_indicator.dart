import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';

class OrderSelectCheckIndicator extends StatelessWidget {
  final bool? active;
  final double? w;
  final double? h;
  final Function? onTap;

  OrderSelectCheckIndicator({required this.active, this.h, this.w, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => onTap?.call(),
      child: AnimatedContainer(
        duration: AppDurations.ms200,
        width: w ?? 22,
        height: h ?? 22,
        child: WidgetOrEmpty(
          value: active,
          child: Center(
            child: FadeIn(
              child: Icon(
                Icons.check_circle_rounded,
                color: MyColors.mainColor,
              ),
            ),
          ),
          elseChild: const Icon(
            Icons.radio_button_unchecked_rounded,
            color: MyColors.grey153,
          ),
        ),
      ),
    );
  }
}
