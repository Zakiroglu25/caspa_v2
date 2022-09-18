import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubits/promo_code/promo_code_cubit.dart';
import '../../../../infrastructure/cubits/promo_code/promo_code_state.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/delegate/my_printer.dart';
import '../../../../util/screen/widget_or_empty.dart';
import '../../../../widget/custom/caspa_payment_radio.dart';
import '../../../../widget/general/caspa_loading.dart';

class PromoPayButton extends StatelessWidget {
  const PromoPayButton(
      {Key? key,
      required this.snapShoot,
      required this.mainContext,
      required this.weight})
      : super(key: key);
  final BuildContext mainContext;
  final AsyncSnapshot<Object?> snapShoot;
  final num weight;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (contextK) => PromoCodeCubit()..checkPromoIsPayable(),
      child: BlocBuilder<PromoCodeCubit, PromoCodeState>(
        builder: (contextK, state) {
          bbbb('state:::::::::: $state');
          if (state is PromoCodeChecked) {
            String value = state.value;
            return WidgetOrEmpty(
                value: value == '1' && weight <= 1,
                child: CaspaPaymentRadio(
                  mainContext,
                  snapShoot: snapShoot,
                  value: MyText.withPromoCode,
                ));
          } else if (state is PromoCodeInProgress) {
            return CaspaLoading();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
