import 'package:caspa_v2/infrastructure/cubits/payment_balance/payment_balance_cubit.dart';
import 'package:caspa_v2/infrastructure/models/local/payments.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/enums/payment_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'by_card_choice.dart';
import 'from_my_balance_choice.dart';
import 'payment_widget.dart';

class PaymentTypesListView extends StatelessWidget {
  final List<PaymentTypeModel> paymentList = <PaymentTypeModel>[
    PaymentTypeModel(
        title: MyText.fromBalance,
        child: FromMyBalanceChoice(),
        paymentType: PaymentType.from_balance),
    PaymentTypeModel(
        title: MyText.byCard,
        child: ByCardChoice(),
        paymentType: PaymentType.by_card),
    // PaymentTypeModel(
    //     title: MyText.i_will_pay_later, paymentType: PaymentType.later)
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<PaymentBalanceCubit>(context).paymentType,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Column(
          children: [
            ...paymentList.map((e) {
              return PaymentWidget(
                title: e.title,
                onTap: () => BlocProvider.of<PaymentBalanceCubit>(context)
                    .updatePaymentType(e.paymentType),
                selected: e.paymentType ==
                    BlocProvider.of<PaymentBalanceCubit>(context)
                        .paymentType
                        .valueOrNull,
                child: e.child,
              );
            }).toList()
          ],
        );
      },
    );
  }
}
