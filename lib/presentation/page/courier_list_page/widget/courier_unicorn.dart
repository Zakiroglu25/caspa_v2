import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import '../../../../infrastructure/models/remote/response/packages_data.dart';
import 'courier_edit_and_delete.dart';
import 'courier_order_unicorn.dart';
import 'courier_pay_button.dart';

class CourierUnicorn extends StatelessWidget {
  final CourierOrder courier;
  final List<Package> packages;

  const CourierUnicorn({required this.courier, required this.packages});
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
          ),
          CourierEditAndDelete(
            courier: courier,
            packages: packages,

          )
        ],
      ),
    );
  }
}
