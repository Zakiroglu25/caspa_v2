import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'courier_selectable_order.dart';

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
        return StreamBuilder<List<Package>>(
            stream: BlocProvider.of<CourierCubit>(context).selectedOrdersStream,
            builder: (context, snapshot) {
              return CourierSelectableOrder(
                index: index,
                package: currentPackage,
                onTap: currentPackage.payment == 1
                    ? () =>
                        context.read<CourierCubit>().addOrder(currentPackage)
                    : null,
                selected: snapshot.data?.contains(currentPackage) ?? false,
              );
            });
      },
    );
  }
}
