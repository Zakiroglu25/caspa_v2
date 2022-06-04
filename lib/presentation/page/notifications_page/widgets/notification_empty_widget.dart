import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/delegate/pager.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';

class NotificationEmptyWidget extends StatelessWidget {
  const NotificationEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 120, height: 120, child: Image.asset(Assets.pngHeart)),
        Text(
          "Bildiriş yoxdur",
          style: AppTextStyles.coHead400.copyWith(
            fontSize: 25.sp,
          ),
        ),
        MySizedBox.h8,
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40),
          child: Text(
            "Hörmətli müştəri, hazırda bildirişləriniz olmadığı üçün bu bölmədə heç bir məlumat yoxdur. Təklif edirik vəziyyəti düzəldək 😎",
            textAlign: TextAlign.center,
            style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
          ),
        ),
        MySizedBox.h16,
        CaspaButton(
          text: "Bağlama sifariş et",
          w: 140,
          onTap: () {
            Go.to(context, Pager.orderViaLinkList);
          },
        ),
      ],
    );
  }
}
