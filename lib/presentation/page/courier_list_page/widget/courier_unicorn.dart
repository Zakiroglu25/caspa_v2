import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'courier_order_unicorn.dart';
import 'courier_pay_button.dart';

class CourierUnicorn extends StatelessWidget {
  final CourierOrder courier;
  const CourierUnicorn({required this.courier});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Paddings.paddingV8,
      child: Stack(
        children: [
          CourierOrderUnicorn(
            courier: courier,
          ),
          CourierPayButton(
            courier: courier,
          )
        ],
      ),
    );
  }
}
