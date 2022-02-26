import 'package:flutter/material.dart';

import '../../../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../../../infrastructure/models/remote/response/link_order_model.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/screen/alert.dart';
import '../../../../util/screen/widget_or_empty.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/general/caspa_radio.dart';

class PayButton extends StatelessWidget {
  const PayButton({Key? key, required this.order}) : super(key: key);
  final LinkOrder order;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 35,
        right: 15,
        child: WidgetOrEmpty(
          value: order.payment == 0,
          child: SizedBox(
            height: 40,
            width: 80,
            child: CaspaButton(
              text: MyText.pay,
              textSize: 13,
              onTap: () => Alert.body(context,
                  title: MyText.choosePaypentType,
                  cancelButton: true,
                  buttonText: MyText.goOn,
                  onTap: () => context
                      .read<PackageDetailsCubit>()
                      .orderMakePayment(id: order.id!, context: context),
                  image: Image.asset(
                    Assets.linkGirl,
                    width: 100,
                    height: 100,
                  ),
                  content: StreamBuilder(
                    stream: BlocProvider.of<PackageDetailsCubit>(context)
                        .payTypeStream,
                    builder: (contextK, snapShoot) {
                      return ListView(
                        shrinkWrap: true,
                        padding: Paddings.paddingV12,
                        children: [
                          buildCaspaRadio(context, snapShoot,
                              value: MyText.fromBalance),
                          buildCaspaRadio(context, snapShoot,
                              value: MyText.byCard),
                          buildCaspaRadio(context, snapShoot,
                              value: MyText.fromCashback),
                          // buildCaspaRadio(context, snapShoot,
                          //     value: MyText.withPromoCode),
                        ],
                      );
                    },
                  )),
            ),
          ),
        ));
  }

  CaspaRadio buildCaspaRadio(
      BuildContext context, AsyncSnapshot<Object?> snapShoot,
      {required String value}) {
    return CaspaRadio(
        onTap: () => context.read<PackageDetailsCubit>().updatePayType(value),
        title: value,
        isActive: snapShoot.data == value);
  }
}
