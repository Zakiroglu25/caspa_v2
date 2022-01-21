import 'package:caspa_v2/infrastructure/models/remote/response/gift_balance.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
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
          Flexible(
            child: Text(
              giftBalance.code!,
              style: AppTextStyles.sanF400
                  .copyWith(fontSize: 16.sp, color: MyColors.grey153),
            ),
          ),
          Spacer(),
          Text(
            giftBalance.date.toString(),
            style: AppTextStyles.sanF400
                .copyWith(fontSize: 16.sp, color: MyColors.grey153),
          ),
          Spacer(),
          Text(
            "${giftBalance.amount} AZN",
            style: AppTextStyles.sanF400
                .copyWith(fontSize: 16.sp, color: MyColors.grey153),
          ),
        ],
      ),
    );
  }
}
