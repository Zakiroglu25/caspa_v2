import 'package:caspa_v2/infrastructure/cubits/gift_balance/gift_balance_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GiftCodeField extends StatelessWidget {
  final TextEditingController? controller;

  GiftCodeField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<GiftBalanceCubit>(context).promoCodeStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.giftCode,
          maxLines: 1,
          hint: MyText.giftCode,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<GiftBalanceCubit>(context).updatePromoCode(value),
        );
      },
    );
  }
}
