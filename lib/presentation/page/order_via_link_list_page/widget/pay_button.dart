import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../../../infrastructure/models/remote/response/link_order_model.dart';
import '../../../../infrastructure/services/hive_service.dart';
import '../../../../locator.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/screen/alert.dart';
import '../../../../util/screen/widget_or_empty.dart';
import '../../../../widget/custom/buttons/app_button.dart';
import '../../../../widget/custom/caspa_payment_radio.dart';

class PayButton extends StatelessWidget {
  const PayButton({Key? key, required this.order}) : super(key: key);
  final LinkOrder order;

  @override
  HiveService get _prefs => locator<HiveService>();

  Widget build(BuildContext context) {
    return Positioned(
        bottom: 35,
        right: 15,
        child: WidgetOrEmpty(
          value: order.payment == 0,
          child: SizedBox(
            height: 40,
            width: 80,
            child: AppButton(
              text: MyText.pay,
              textSize: 13,
              onTap: () => Alert.body(context,
                  title: MyText.choosePaypentType,
                  cancelButton: true,
                  buttonText: MyText.goOn,
                  onTap: () => context
                      .read<PackageDetailsCubit>()
                      .orderMakePayment(
                          id: order.id!, context: context, ids: []),
                  image: Image.asset(
                    Assets.linkGirl,
                    width: 140,
                    height: 140,
                  ),
                  content: StreamBuilder(
                    stream: BlocProvider.of<PackageDetailsCubit>(context)
                        .payTypeStream,
                    builder: (contextK, snapShoot) {
                      return ListView(
                        shrinkWrap: true,
                        padding: Paddings.paddingV12,
                        children: [
                          CaspaPaymentRadio(
                            context,
                            snapShoot: snapShoot,
                            description: "(${_prefs.user.balance} TL)",
                            value: MyText.fromBalance,
                          ),
                          CaspaPaymentRadio(context,
                              snapShoot: snapShoot, value: MyText.byCard),
                          // CaspaPaymentRadio(context,
                          //     snapShoot: snapShoot,
                          //     description: "(${_prefs.user.bonus} \$)",
                          //     value: MyText.fromBonus),
                          // buildAppRadio(context, snapShoot,
                          //     value: MyText.withPromoCode),
                        ],
                      );
                    },
                  )),
            ),
          ),
        ));
  }
}
