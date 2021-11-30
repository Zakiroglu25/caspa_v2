import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';

import 'courier_order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderList extends StatefulWidget {
  List<dynamic>? orders;
  OrderList({
    required this.orders,
  });

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: Physics.never,
      itemCount: widget.orders!.length,
      padding: EdgeInsets.only(bottom: 170),
      itemBuilder: (context, index) {
        return CourierOrder(
          order: widget.orders![index],
          onTap: () => setState(() {
            context
                .read<CourierCubit>()
                .addOrderId(widget.orders![index]['id']);
          }),
          selectedOrders: context.read<CourierCubit>().selectedOrders.value,
        );
      },
    );
  }
}
