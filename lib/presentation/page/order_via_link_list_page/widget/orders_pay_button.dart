import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../infrastructure/cubits/order_via_url_list/order_via_url_list_cubit.dart';

class OrdersPayButton extends StatelessWidget {
  const OrdersPayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LinkOrder>>(
      stream:
          BlocProvider.of<OrderViaUrlListCubit>(context).selectedOrdersStream,
      builder: (context, snapshot) {
        final selectedOrders = snapshot.data;
        final res = selectedOrders?.fold<double>(
            0,
            (double previousValue, LinkOrder element) =>
                previousValue +
                (double.parse(element.price!) * element.qty! +
                    double.parse(element.cargoPrice!)));
        return CaspaButton(
          isButtonActive: snapshot.data?.isNotEmpty,
          text: '${MyText.pay} (${selectedOrders?.length} ədəd) ',
          onTap: () => context.read<OrderViaUrlListCubit>().paySelectedOrders(),
        );
        ;
      },
    );
  }
}
