import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';

import 'courier_order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderList extends StatelessWidget {
  final List<Package> packageList;
  OrderList({
    required this.packageList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: Physics.never,
      itemCount: packageList.length,
      padding: Paddings.paddingB110,
      itemBuilder: (context, index) {
        final currentPackage = packageList[index];
        return CourierOrder(
          index: index,
          package: currentPackage,
          //   selectedOrders: context.read<CourierCubit>().selectedOrders.value,
        );
      },
    );
  }
}
