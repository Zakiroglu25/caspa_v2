import 'package:caspa_v2/infrastructure/cubits/payment_balance/payment_balance_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/payment_balance/payment_balance_state.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'fields/amount_field.dart';
import '../webview_page/webview_page.dart';

class AddBalancePage extends StatelessWidget {
  PaymentBalanceType paymentBalance;

  AddBalancePage({required this.paymentBalance});

  late TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        contextA: context,
        user: false,
        notification: false,
      ),
      body: BlocConsumer<PaymentBalanceCubit, PaymentBalanceState>(
        listener: (context, state) {
          if (state is PaymentBalanceUrlFetched) {
            FullScreenLoading.hide(context);
          }
          if (state is PaymentBalanceSuccess) {
            FullScreenLoading.hide(context);
            //Go.pop(context);
          }

          if (state is PaymentBalanceInProgress) {
            FullScreenLoading.display(context);
          }
        },
        builder: (context, state) {
          if (state is PaymentBalanceUrlFetched) {
            return WebviewPage(
              url: state.url,
              mainContext: context,
              whenSuccess: () =>
                  context.read<PaymentBalanceCubit>().paymentSuccess(context),
            );
          } else {
            return Stack(
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
                        .read<PaymentBalanceCubit>()
                        .getPaymentUrl(context,
                            paymentBalanceType: paymentBalance),
                  ),
                  bottom: 20,
                  left: 16,
                  right: 16,
                )
              ],
            );
          }
        },
      ),
    );
  }
}
