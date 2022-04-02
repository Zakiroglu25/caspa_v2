import 'package:caspa_v2/infrastructure/cubits/payment_balance/payment_balance_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/formatter/decimal_input_formatter.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/enums/payment_balance.dart';

class AmountField extends StatelessWidget {
  final TextEditingController? controller;
  final PaymentBalanceType paymentBalance;

  AmountField(
      {this.controller,
      required this.paymentBalance}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: BlocProvider.of<PaymentBalanceCubit>(context).priceStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.amountmoney,
          maxLines: 1,
          hint: MyText.amountmoney,
          upperCase: true,
          suffixText: paymentBalance == PaymentBalanceType.order
              ? (MyText.tryy + "   ")
              : (MyText.usd + "   "),
          textInputType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          formatters: [
            DecimalTextInputFormatter(
                activatedNegativeValues: false, decimalRange: 3)
          ],
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          // controller: controller,
          onChanged: (value) =>
              BlocProvider.of<PaymentBalanceCubit>(context).updatePrice(value),
        );
      },
    );
  }
}
