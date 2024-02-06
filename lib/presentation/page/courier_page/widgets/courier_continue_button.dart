import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:caspa_v2/widget/general/app_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/models/remote/response/courier_orders_model.dart';
import '../../../../infrastructure/models/remote/response/packages_data.dart';

class CourierContinueButton extends StatelessWidget {
  final CourierOrder? courierOrder;

  CourierContinueButton({this.courierOrder});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 16,
      right: 16,
      child: StreamBuilder<List<Package>>(
        stream: BlocProvider.of<CourierCubit>(context).selectedOrdersStream,
        builder: (context, snapshot) {
          return AppButton(
            loading:
                (context.read<CourierCubit>().state is CourierInProgressButton),
            isButtonActive: snapshot.data?.isNotEmpty,
            text: MyText.goOn,
            onTap: () => context
                .read<CourierCubit>()
                .configureCourier(context, courierId: courierOrder?.id),
          );
        },
      ),
    );
  }

  AppRadio buildAppRadio(
      BuildContext context, AsyncSnapshot<Object?> snapShoot,
      {required String value}) {
    return AppRadio(
        onTap: () => context.read<CourierCubit>().updatePayType(value),
        title: value,
        isActive: snapShoot.data == value);
  }
}
