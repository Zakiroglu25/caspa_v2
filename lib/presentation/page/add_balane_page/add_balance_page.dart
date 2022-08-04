import 'package:caspa_v2/infrastructure/cubits/payment_balance/payment_balance_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/payment_balance/payment_balance_state.dart';
import 'package:caspa_v2/presentation/page/add_balane_page/widgets/balance_packages.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fields/amount_field.dart';
import '../webview_page/webview_page.dart';
import 'widgets/price_package.dart';

class AddBalancePage extends StatelessWidget {
  final PaymentBalanceType paymentBalance;

  const AddBalancePage({required this.paymentBalance});

  @override
  Widget build(BuildContext context) {
    final payCubit = BlocProvider.of<PaymentBalanceCubit>(context);
    return WillPopScope(
      onWillPop: () async {
        if (BlocProvider.of<PaymentBalanceCubit>(context).state
            is PaymentBalanceUrlFetched) {
          BlocProvider.of<PaymentBalanceCubit>(context).back();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: CaspaAppbar(
          title: "",
          contextA: context,
          user: false,
          onBack: () {
            if (payCubit.state is PaymentBalanceUrlFetched) {
              payCubit.back();
            } else {
              Go.pop(context);
            }
          },
          notification: false,
        ),
        body: SafeArea(
          child: BlocConsumer<PaymentBalanceCubit, PaymentBalanceState>(
            listener: (context, state) {
              if (state is PaymentPriceError) {
                Snack.display(
                    context: context,
                    message: state.error ?? MyText.errorPrice);
              }
              if (state is PaymentBalanceError) {
                Snack.display(
                    context: context,
                    message: state.error ?? MyText.error); //Go.pop(context);
              }
            },
            builder: (context, state) {
              if (state is PaymentBalanceUrlFetched) {
                return WebviewPage(
                  url: state.url,
                  mainContext: context,
                  whenSuccess: () => context
                      .read<PaymentBalanceCubit>()
                      .paymentSuccess(context),
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
                        MySizedBox.h16,
                        AmountField(
                          paymentBalance: paymentBalance,
                          // controller: controller,
                        ),
                        BalancePackages(
                          paymentBalance: paymentBalance,
                        ),

                        MySizedBox.h100,
                        // WidgetOrEmpty(
                        //     value: paymentBalance == PaymentBalanceType.cargo,
                        //     child: const BalancePackages())
                      ],
                    ),
                    Positioned(
                      child: CaspaButton(
                        loading: payCubit.state is PaymentBalanceInProgress,
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
        ),
      ),
    );
  }
}
