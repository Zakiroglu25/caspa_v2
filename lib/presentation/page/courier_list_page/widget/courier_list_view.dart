import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/presentation/page/courier_list_page/widget/courier_unicorn.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/models/remote/response/packages_data.dart';

class CourierListView extends StatelessWidget {
  final List<CourierOrder> courierList;
  final List<Package> packages;

  CourierListView(this.courierList, this.packages);

  @override
  Widget build(BuildContext context) {
    return ListOrEmpty(
        list: courierList,
        child: ListView.builder(
          itemCount: courierList.length,
          padding: Paddings.paddingA16 + Paddings.paddingB100,
          itemBuilder: (context, index) {
            return CourierUnicorn(
              courier: courierList[index],
              packages: packages,
            );
          },
        ));
  }
}
