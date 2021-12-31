import 'package:caspa_v2/infrastructure/models/local/payments.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/enums/payment_type.dart';
import 'package:flutter/material.dart';

import 'by_card_choice.dart';
import 'from_my_balance_choice.dart';
import 'payment_widget.dart';

class PaymentTypesListView extends StatelessWidget {
  final List<PaymentKind> paymentList = <PaymentKind>[
    PaymentKind(
        title: MyText.fromMyBalance,
        child: FromMyBalanceChoice(),
        paymentType: PaymentType.from_balance),
    PaymentKind(
        title: MyText.byCard,
        child: ByCardChoice(),
        paymentType: PaymentType.by_card),
    PaymentKind(title: MyText.i_will_pay_later, paymentType: PaymentType.later)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...paymentList.map((e) {
          return PaymentWidget(
            title: e.title,
            selected: e.paymentType == PaymentType.by_card,
            child: e.child,
          );
        }).toList()
      ],
    );
  }
}
