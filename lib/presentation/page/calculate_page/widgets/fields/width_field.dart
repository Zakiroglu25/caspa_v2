import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_capacity/calculate_capacity_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/formatter/decimal_input_formatter.dart';

class WidthField extends StatelessWidget {
  final TextEditingController? controller;

  WidthField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<CalculateCapacityCubit>(context).width,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.width_under,
          maxLines: 1,
          hint: MyText.width_hint,
          upperCase: true,
          textInputType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
          formatters: [DecimalTextInputFormatter(decimalRange: 5)],
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) => BlocProvider.of<CalculateCapacityCubit>(context)
              .updateWidth(value),
        );
      },
    );
  }
}
