import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class OrderViaLinkContinueButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return CaspaButton(
      onTap: () {

        context.read<OrderViaUrlCubit>().orderViaLink(context);
       // Go.to(context, NewOrderPaymentPage());
      },
      text: "Davam et",
    );
  }
}
