import 'package:caspa_v2/presentation/page/add_balane_page/widgets/price_package.dart';
import 'package:flutter/material.dart';

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
          style: UITextStyle.tW400BigBlack,
        ),
        MySizedBox.h16,
        PricePackage(
          gift: '5',
          index: 1,
          price: '15',
        ),
        PricePackage(
          gift: '10',
          index: 2,
          price: '30',
        ),
        PricePackage(
          gift: '20',
          index: 3,
          price: '50',
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
