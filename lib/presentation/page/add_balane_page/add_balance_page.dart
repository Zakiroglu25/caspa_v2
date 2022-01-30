import 'package:caspa_v2/infrastructure/cubits/payment/payment_cubit.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fields/amount_field.dart';

class AddBalancePage extends StatelessWidget {
  PaymentBalanceType paymentBalance;

  AddBalancePage({required this.paymentBalance});

  late TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        user: false,
        notification: false,
      ),
      body: Stack(
        children: [
          ListView(
            padding: Paddings.paddingH16,
            children: [
              Text(
                MyText.balanceIncrease,
                style: UITextStyle.tW400BigBlack,
              ),
              MySizedBox.h32,
              AmountField(
                  // controller: controller,
                  ),
            ],
          ),
          Positioned(
            child: CaspaButton(
              text: MyText.addBalance,
              onTap: () => context
                  .read<PaymentCubit>()
                  .getPaymentUrl(context, paymentBalanceType: paymentBalance),
            ),
            bottom: 20,
            left: 16,
            right: 16,
          )
        ],
      ),
    );
  }
}
