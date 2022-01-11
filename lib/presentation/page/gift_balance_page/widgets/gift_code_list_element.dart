import 'package:caspa_v2/infrastructure/models/remote/response/gift_balance.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/promo_code_response.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftCodeListElement extends StatelessWidget {
  final GiftBalance giftBalance;

  GiftCodeListElement({required this.giftBalance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingV14,
      child: Row(
        children: [
          Text(
            giftBalance.code!,
            style: AppTextStyles.sanF400
                .copyWith(fontSize: 16.sp, color: MyColors.grey153),
          ),
          MySizedBox.w45,
          // Text(
          //   promoCode.date.toString(),
          //   style: AppTextStyles.sanF400.copyWith(
          //       fontSize: 16.sp, color: MyColors.grey153),
          // ),
          Spacer(),
          // Text(
          //   giftBalance.used == 1 ? MyText.yes : MyText.no,
          //   style: AppTextStyles.sanF400
          //       .copyWith(fontSize: 16.sp, color: MyColors.grey153),
          // ),
        ],
      ),
    );
  }
}
