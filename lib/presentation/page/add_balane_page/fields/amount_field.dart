import 'package:caspa_v2/infrastructure/cubits/payment/payment_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/formatter/decimal_input_formatter.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountField extends StatelessWidget {
  final TextEditingController? controller;

  AmountField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: BlocProvider.of<PaymentCubit>(context).priceStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.amountmoney,
          maxLines: 1,
          hint: MyText.amountmoney,
          upperCase: true,
          textInputType: const TextInputType.numberWithOptions(
              signed: false, decimal: true),
          formatters: [
            DecimalTextInputFormatter(
                activatedNegativeValues: false, decimalRange: 3)
          ],
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
           // controller: controller,
          onChanged: (value) =>
              BlocProvider.of<PaymentCubit>(context).updatePrice(value),
        );
      },
    );
  }
}
