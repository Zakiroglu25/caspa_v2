import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';

import '../custom/order_select_radio_indicator.dart';

class CaspaRadio extends StatelessWidget {
  Function? onTap;
  String? title;
  int? id;
  bool? isActive;

  CaspaRadio(
      {required this.onTap,
      required this.title,
      this.id,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      child: Container(
        // height: 35,
        padding: Paddings.paddingV8 + Paddings.paddingH16 + Paddings.paddingB8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                title!,
                style: AppTextStyles.sanF400.copyWith(fontSize: 16),
              ),
            ),
            //context.read<RegisterCubit>().
            MySizedBox.w5,

            FlipInY(
                duration: Duration(milliseconds: 500),
                child: OrderSelectRadioIndicator(
                  active: isActive,
                  w: 20,
                  h: 20,
                ))

            //:
          ],
        ),
      ),
      onTap: () {
        onTap?.call();
      },
    );
  }
}
