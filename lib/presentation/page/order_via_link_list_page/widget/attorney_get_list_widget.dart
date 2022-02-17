import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';

import 'order_box.dart';

class OrderListWidget extends StatelessWidget {
  final List<LinkOrder> orderList;

  OrderListWidget({
    Key? key,
    required this.orderList,
  });

  @override
  Widget build(BuildContext context) {
    return ListOrEmpty(
      list: orderList,
      child: ListView.builder(
          shrinkWrap: true,
          physics: Physics.never,
          itemBuilder: (context, index) {
            LinkOrder data = orderList[index];
            return FadeInUp(
                duration: Duration(milliseconds: AppOperations.getTime(index)),
                child: OrderBox(data));
          },
          itemCount: orderList.length),
    );
  }
}
