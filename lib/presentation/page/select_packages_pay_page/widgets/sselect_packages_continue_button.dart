import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/infrastructure/cubits/select_packages_pay/select_packages_pay_cubit.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/models/remote/response/courier_orders_model.dart';
import '../../../../infrastructure/models/remote/response/packages_data.dart';

class SelectPackagesContinueButton extends StatelessWidget {
  final CourierOrder? courierOrder;
  SelectPackagesContinueButton({this.courierOrder});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: StreamBuilder<List<Package>>(
        stream: BlocProvider.of<SelectPackagesPayCubit>(context)
            .selectedOrdersStream,
        builder: (context, snapshot) {
          final selectedOrders = snapshot.data;
          final price = selectedOrders?.fold<double>(
              0,
              (double previousValue, Package element) =>
                  previousValue + (double.parse(element.cargoPrice!)));
          return CaspaButton(
            loading: (context.read<SelectPackagesPayCubit>().state
                is CourierInProgressButton),
            isButtonActive: snapshot.data?.isNotEmpty,
            text: '${MyText.pay} (${selectedOrders?.length} ədəd) $price USD',
            onTap: () =>
                context.read<SelectPackagesPayCubit>().paySelectedOrders(),
          );
        },
      ),
    );
  }
}