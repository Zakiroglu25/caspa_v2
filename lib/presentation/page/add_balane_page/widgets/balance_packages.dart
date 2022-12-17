import 'package:caspa_v2/presentation/page/add_balane_page/widgets/price_package.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/sized_box.dart';
import '../../../../util/enums/payment_balance.dart';

class BalancePackages extends StatelessWidget {
  const BalancePackages({Key? key, required this.paymentBalance})
      : super(key: key);

  final PaymentBalanceType paymentBalance;
  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: paymentBalance == PaymentBalanceType.cargo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // MySizedBox.h48,
          // Text(
          //   MyText.packageGift,
          //   style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
          // ),
          // MySizedBox.h16,
          PricePackage(
            price: '10',
            gift: '1',
            index: 5,
          ),
          PricePackage(
            price: '25',
            gift: '5',
            index: 1,
          ),
          PricePackage(
            price: '50',
            gift: '15',
            index: 2,
          ),
          PricePackage(
            price: '75',
            gift: '25',
            index: 3,
          ),
          PricePackage(
            price: '100',
            gift: '50',
            index: 4,
          ),

          MySizedBox.h100
        ],
      ),
    );
  }
}
