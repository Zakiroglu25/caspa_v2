import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubits/delivery_adress_operations/delivery_address_operations_cubit.dart';
import '../../../../infrastructure/cubits/delivery_adress_operations/delivery_address_operations_state.dart';
import '../../../../util/constants/text.dart';
import '../../../../widget/custom/buttons/app_button.dart';

class DeliveryAddressOperationsAddButton extends StatelessWidget {
  const DeliveryAddressOperationsAddButton({Key? key, this.id})
      : super(key: key);
  final int? id;
  @override
  Widget build(BuildContext context) {
    return AppButton(
      loading: (context.watch<DeliveryAdressOperationsCubit>().state
          is DeliveryAdressOperationsInProgress),
      text: MyText.save,
      onTap: () =>
          context.read<DeliveryAdressOperationsCubit>().add(context, id: id),
    );
  }
}
