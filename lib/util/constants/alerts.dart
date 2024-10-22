import 'package:caspa_v2/infrastructure/services/navigation_service.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../infrastructure/services/hive_service.dart';
import '../../locator.dart';
import '../../widget/custom/caspa_payment_radio.dart';
import '../delegate/app_operations.dart';
import '../screen/alert.dart';
import 'assets.dart';

class Alerts {
  Alerts._();

  static HiveService get _prefs => locator<HiveService>();

  static courierPaymentAlert(
          {required BuildContext context, required courierId}) =>
      Alert.body(context,
          title: MyText.choosePaypentType,
          cancelButton: true,
          buttonText: MyText.goOn,
          onTap: () => context
              .read<PackageDetailsCubit>()
              .courierMakePayment(context: context, id: courierId),
          image: Image.asset(
            Assets.linkGirl,
            width: 100,
            height: 100,
          ),
          content: StreamBuilder(
            stream: BlocProvider.of<PackageDetailsCubit>(context).payTypeStream,
            builder: (contextK, snapShoot) {
              return ListView(
                shrinkWrap: true,
                padding: Paddings.paddingV12,
                children: [
                  CaspaPaymentRadio(context,
                      snapShoot: snapShoot,
                      description: "(${_prefs.user.cargoBalance} \$)",
                      value: MyText.fromBalance),
                  CaspaPaymentRadio(context,
                      snapShoot: snapShoot, value: MyText.byCard),
                  CaspaPaymentRadio(context,
                      snapShoot: snapShoot,
                      description: "(${_prefs.user.bonus} \$)",
                      value: MyText.fromBonus),

                  // buildAppRadio(context, snapShoot,
                  //     value: MyText.withPromoCode),
                ],
              );
            },
          ));

  static selectedOrdersPaymentAlert(
          {required BuildContext context, required List<int> selectedOrders}) =>
      Alert.body(context,
          title: MyText.choosePaypentType,
          cancelButton: true,
          buttonText: MyText.goOn,
          onTap: () => context
              .read<PackageDetailsCubit>()
              .orderListMakePayment(context: context, ids: selectedOrders),
          image: Image.asset(
            Assets.linkGirl,
            width: 140,
            height: 140,
          ),
          content: StreamBuilder(
            stream: BlocProvider.of<PackageDetailsCubit>(context).payTypeStream,
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
          ));

  static selectedPackagessPaymentAlert(
          {required BuildContext context, required List<int> selectedOrders}) =>
      Alert.body(context,
          title: MyText.choosePaypentType,
          cancelButton: true,
          buttonText: MyText.goOn,
          onTap: () => context
              .read<PackageDetailsCubit>()
              .packageListMakePayment(context: context, ids: selectedOrders),
          image: Image.asset(
            Assets.linkGirl,
            width: 140,
            height: 140,
          ),
          content: StreamBuilder(
            stream: BlocProvider.of<PackageDetailsCubit>(context).payTypeStream,
            builder: (contextK, snapShoot) {
              return ListView(
                shrinkWrap: true,
                padding: Paddings.paddingV12,
                children: [
                  CaspaPaymentRadio(
                    context,
                    snapShoot: snapShoot,
                    description: "(${_prefs.user.cargoBalance} USD)",
                    value: MyText.fromBalance,
                  ),
                  CaspaPaymentRadio(context,
                      snapShoot: snapShoot, value: MyText.byCard),
                  CaspaPaymentRadio(context,
                      snapShoot: snapShoot,
                      description: "(${_prefs.user.bonus} \$)",
                      value: MyText.fromBonus),
                  // CaspaPaymentRadio(context,
                  //     snapShoot: snapShoot,
                  //     description: "(${_prefs.user.cashback_balance} \$)",
                  //     value: MyText.fromCashback),
                  // buildAppRadio(context, snapShoot,
                  //     value: MyText.withPromoCode),
                ],
              );
            },
          ));

  static get notificationSettings =>
      Alert.show(NavigationService.instance.navigationKey!.currentContext!,
          cancelButton: true,
          onTap: () => AppOperations.openNotificationSettings(),
          title: MyText.activeNotificationSound,
          content: MyText.clickContinueButtonAndAllowSounds,
          buttonText: MyText.goOn);
}
