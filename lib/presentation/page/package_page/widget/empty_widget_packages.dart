import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/delegate/pager.dart';
import '../../../../widget/custom/buttons/app_button.dart';

class EmptyPackagesWidget extends StatelessWidget {
  const EmptyPackagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 120, height: 120, child: Image.asset(Assets.pngSebet)),
        Text(
          MyText.emptyTitle,
          style: AppTextStyles.coHead400.copyWith(
            fontSize: 25.sp,
          ),
        ),
        MySizedBox.h8,
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Text(
            MyText.emptyDesc,
            textAlign: TextAlign.center,
            style: AppTextStyles.sanF400
                .copyWith(color: MyColors.grey153, height: 20 / 14),
          ),
        ),
        MySizedBox.h16,
        AppButton(
          text: MyText.emptyButton,
          textSize: 14,
          w: 142,
          h: 44,
          onTap: () {
            Go.to(context, Pager.orderViaLinkList);
          },
        ),
      ],
    );
  }
}
