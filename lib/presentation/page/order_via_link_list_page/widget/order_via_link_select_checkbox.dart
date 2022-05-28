import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubits/order_via_url_list/order_via_url_list_cubit.dart';
import '../../../../infrastructure/models/remote/response/link_order_model.dart';
import '../../../../widget/custom/order_select_check_indicator.dart';

class OrderViaLinkSelectCheckbox extends StatelessWidget {
  const OrderViaLinkSelectCheckbox({Key? key, required this.order})
      : super(key: key);
  final LinkOrder order;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 30,
        right: 15,
        child: StreamBuilder<List<LinkOrder>>(
          stream: BlocProvider.of<OrderViaUrlListCubit>(context)
              .selectedOrdersStream,
          builder: (context, snapshot) {
            return OrderSelectCheckIndicator(
              active: snapshot.data?.contains(order),
              onTap: () => context.read<OrderViaUrlListCubit>().addOrder(order),
            );
            ;
          },
        ));
  }
}
