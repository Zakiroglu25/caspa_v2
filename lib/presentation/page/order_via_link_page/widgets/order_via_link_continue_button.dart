import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubits/order_via_url/order_via_url_state.dart';
import '../../../../infrastructure/models/remote/response/link_order_model.dart';

class OrderViaLinkContinueButton extends StatelessWidget {
  final LinkOrder? order;

  OrderViaLinkContinueButton({this.order});

  @override
  Widget build(BuildContext context) {
    return CaspaButton(
      loading:
          (context.read<OrderViaUrlCubit>().state is OrderViaUrlInProgress),
      onTap: () {
        order == null
            ? context.read<OrderViaUrlCubit>().addOrderViaLink(context)
            : context.read<OrderViaUrlCubit>().edit(context, order: order!);
        // Go.to(context, NewOrderPaymentPage());
      },
      text: "Davam et",
    );
  }
}
