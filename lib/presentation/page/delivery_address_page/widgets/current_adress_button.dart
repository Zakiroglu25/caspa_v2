import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';

class CurrentAdressButton extends StatelessWidget {
  const CurrentAdressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      left: 16,
      bottom: 30,
      child: CaspaButton(
        h: 72,
        child: Padding(
          padding: Paddings.paddingA16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.svgSend),
              MySizedBox.w16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MyText.currentAdress,
                    style: AppTextStyles.sanF500.copyWith(
                        color: MyColors.white, fontWeight: FontWeight.w600),
                  ),
                  MySizedBox.h4,
                  Text(
                    "Qara Qarayev 8",
                    style: AppTextStyles.sanF500
                        .copyWith(color: MyColors.white, fontSize: 12),
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
