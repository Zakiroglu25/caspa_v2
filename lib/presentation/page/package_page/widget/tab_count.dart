import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:flutter/material.dart';

class TabCount extends StatelessWidget {
  final int? count;

  TabCount({required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (count != 0)
          Container(
            height: 24,
            //  width: 20,
            padding: Paddings.paddingA4 + Paddings.paddingH4,
            child: Center(
              child: Text(
                "${count}",
                style: AppTextStyles.sanF500.copyWith(color: MyColors.white),
              ),
            ),
            decoration: BoxDecoration(
              color: MyColors.errorRED211,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(24),
                right: Radius.circular(24),
              ),
              //    shape: BoxShape.circle
            ),
          ),
      ],
    );
  }
}
