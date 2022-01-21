import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourierContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final courierCubit = context.watch<CourierCubit>();
    return Positioned(
      bottom: 30,
      left: 16,
      right: 16,
      child: CaspaButton(
        loading:
            (context.read<CourierCubit>().state is CourierInProgressButton),
        isButtonActive:
            (context.watch<CourierCubit>().selectedOrders.value.isNotEmpty),
        text: MyText.goOn,
        //  onTap: () => Go.to(context, Pager.courier_order),
        onTap: () => context.read<CourierCubit>().addCourier(context),
      ),
    );
  }
}
