import 'package:caspa_v2/presentation/page/add_balane_page/widgets/price_package.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/constants/text_styles.dart';

class BalancePackages extends StatelessWidget {
  const BalancePackages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MySizedBox.h48,
        Text(
          MyText.packageGift,
          style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
        ),
        MySizedBox.h16,
        PricePackage(
          gift: '5',
          index: 1,
          price: '25',
        ),
        PricePackage(
          gift: '15',
          index: 2,
          price: '50',
        ),
        PricePackage(
          gift: '25',
          index: 3,
          price: '75',
        ),
        PricePackage(
          gift: '50',
          index: 4,
          price: '100',
        ),
        MySizedBox.h100
      ],
    );
  }
}
