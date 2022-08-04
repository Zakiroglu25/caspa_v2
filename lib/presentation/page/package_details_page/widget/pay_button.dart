import 'package:caspa_v2/infrastructure/cubits/package_details/package_details_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/package_details_page/widget/package_main_button.dart';
import 'package:caspa_v2/presentation/page/package_details_page/widget/promo_pay_button.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubits/promo_code/promo_code_state.dart';
import '../../../../infrastructure/services/hive_service.dart';
import '../../../../locator.dart';
import '../../../../widget/custom/caspa_payment_radio.dart';

class PayButton extends StatelessWidget {
  const PayButton({Key? key, required this.package}) : super(key: key);
  final Package package;

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return PackageMainButton(
        w: (MediaQuery.of(context).size.width - 32),
        text: MyText.pay,
        onTap: () => Alert.body(context,
            title: MyText.choosePaypentType,
            cancelButton: true,
            buttonText: MyText.goOn,
            onTap: () => context
                .read<PackageDetailsCubit>()
                .packageMakePayment(id: package.id!, context: context),
            image: Image.asset(
              Assets.linkGirl,
              width: 140,
              height: 140,
            ),
            content: StreamBuilder(
              stream:
                  BlocProvider.of<PackageDetailsCubit>(context).payTypeStream,
              builder: (contextK, snapShoot) {
                return ListView(
                  shrinkWrap: true,
                  padding: Paddings.paddingV12,
                  children: [
                    CaspaPaymentRadio(
                      context,
                      snapShoot: snapShoot,
                      value: MyText.fromBalance,
                      description: "${_prefs.user.cargoBalance} \$",
                      // +
                      // " " +
                      // "${_prefs.user.cargoBalance}" +
                      // "\$"
                    ),
                    CaspaPaymentRadio(
                      context,
                      snapShoot: snapShoot,
                      value: MyText.byCard,
                    ),
                    CaspaPaymentRadio(
                      context,
                      snapShoot: snapShoot,
                      value: "Bonus",
                      description: "${_prefs.user.bonus} \$"
                      // +
                      // " " +
                      // "${_prefs.user.cashback_balance}" +
                      // "\$"
                      ,
                    ),
                    //bubrada promo olmalidir
                    PromoPayButton(
                      snapShoot: snapShoot,
                      weight: package.weight!,
                      mainContext: context,
                    ),
                  ],
                );
              },
            )));
  }
}
