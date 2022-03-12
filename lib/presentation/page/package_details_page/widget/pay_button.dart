import 'package:caspa_v2/infrastructure/cubits/package_details/package_details_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/package_details_page/widget/package_main_button.dart';
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

class PayButton extends StatelessWidget {
  const PayButton({Key? key, required this.package}) : super(key: key);
  final Package package;
  @override
  Widget build(BuildContext context) {
    // bbbb("package:   $package");
    return PackageMainButton(
        w: (MediaQuery.of(context).size.width - 32),
        text: MyText.pay,
        // onTap: () => Go.to(context, Pager.payment(price: "466"))),
        onTap: () => Alert.body(context,
            title: MyText.choosePaypentType,
            cancelButton: true,
            buttonText: MyText.goOn,
            onTap: () => context
                .read<PackageDetailsCubit>()
                .packageMakePayment(id: package.id!, context: context),
            image: Image.asset(
              Assets.linkGirl,
              width: 100,
              height: 100,
            ),
            content: StreamBuilder(
              stream:
                  BlocProvider.of<PackageDetailsCubit>(context).payTypeStream,
              builder: (contextK, snapShoot) {
                return ListView(
                  shrinkWrap: true,
                  padding: Paddings.paddingV12,
                  children: [
                    buildCaspaRadio(context, snapShoot,
                        value: MyText.fromBalance),
                    buildCaspaRadio(context, snapShoot, value: MyText.byCard),
                    buildCaspaRadio(context, snapShoot,
                        value: MyText.fromCashback),
                    //bubrada promo olmalidir
                    BlocProvider(
                      create: (contextK) =>
                          PromoCodeCubit()..checkPromoIsPayable(),
                      child: BlocBuilder<PromoCodeCubit, PromoCodeState>(
                        builder: (contextK, state) {
                          bbbb('state:::::::::: $state');
                          if (state is PromoCodeChecked) {
                            String value = state.value;
                            return WidgetOrEmpty(
                                value: value == '1' && package.weight! <= 1,
                                child: buildCaspaRadio(context, snapShoot,
                                    value: MyText.withPromoCode));
                          } else if (state is PromoCodeInProgress) {
                            return CaspaLoading();
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            )));
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
