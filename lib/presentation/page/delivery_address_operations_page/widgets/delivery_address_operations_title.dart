import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../widget/custom/buttons/null_icon_button.dart';

class DeliveryAddressOperationsTitle extends StatelessWidget {
  const DeliveryAddressOperationsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(Assets.svgClose),
          ),
          onPressed: () => Go.pop(context),
        ),
        Text(
          MyText.addNewAdress,
          style: AppTextStyles.sanF400.copyWith(fontSize: 18),
        ),
        NullIconButton(),
        //  MySizedBox.w12
      ],
    );
  }
}
