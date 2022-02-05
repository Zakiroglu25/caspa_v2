import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
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
        //  onTap: () => context.read<CourierCubit>().addCourier(context),
        onTap: () => Alert.body(context,
            title: MyText.choosePaypentType,
            cancelButton: true,
            buttonText: MyText.goOn,
            // onTap: () => context
            //     .read<PackageDetailsCubit>()
            //     .makePayment(id: package.id!, context: context),
            image: Image.asset(
              Assets.linkGirl,
              width: 100,
              height: 100,
            ),
            content: StreamBuilder(
              stream: BlocProvider.of<CourierCubit>(context).payTypeStream,
              builder: (contextK, snapShoot) {
                return ListView(
                  padding: Paddings.paddingB12,
                  shrinkWrap: true,
                  children: [
                    buildCaspaRadio(context, snapShoot,
                        value: MyText.fromBalance),
                    buildCaspaRadio(context, snapShoot, value: MyText.byCard),
                    // buildCaspaRadio(context, snapShoot,
                    //     value: MyText.withPromoCode),
                  ],
                );
              },
            )),
      ),
    );
  }

  CaspaRadio buildCaspaRadio(
      BuildContext context, AsyncSnapshot<Object?> snapShoot,
      {required String value}) {
    return CaspaRadio(
        onTap: () => context.read<CourierCubit>().updatePayType(value),
        title: value,
        isActive: snapShoot.data == value);
  }
}
