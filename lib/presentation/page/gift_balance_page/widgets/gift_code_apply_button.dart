import 'package:caspa_v2/infrastructure/cubits/gift_balance/gift_balance_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/gift_balance/gift_balance_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GiftCodeApplyButton extends StatelessWidget {
  const GiftCodeApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<GiftBalanceCubit>(context).promoCodeStream,
      builder: (context, snp) {
        return CaspaButton(
          isButtonActive: snp.hasData,
          text: MyText.apply,
          loading:
              (context.watch<GiftBalanceCubit>().state is GiftBalanceInAdding),
          onTap: () => context.read<GiftBalanceCubit>().addPromo(context),
          //  onTap: () => Alert.show(context),
        );
      },
    );
  }
}
