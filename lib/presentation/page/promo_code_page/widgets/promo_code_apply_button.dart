import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoCodeApplyButton extends StatelessWidget {
  const PromoCodeApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<PromoCodeCubit>(context).promoCodeStream,
      builder: (context, snp) {
        return AppButton(
          isButtonActive: snp.hasData,
          text: MyText.apply,
          loading: (context.watch<PromoCodeCubit>().state is PromoCodeInAdding),
          onTap: () => context.read<PromoCodeCubit>().addPromo(context),
          //  onTap: () => Alert.show(context),
        );
      },
    );
  }
}
