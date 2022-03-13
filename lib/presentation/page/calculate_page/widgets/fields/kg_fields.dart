import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/formatter/decimal_input_formatter.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KgField extends StatelessWidget {
  final TextEditingController? controller;

  KgField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<CalculateKgCubit>(context).kg,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.enter_kg,
          maxLines: 1,
          hint: MyText.enter_kg,
          textInputType:
              TextInputType.numberWithOptions(decimal: true, signed: true),
          formatters: [DecimalTextInputFormatter(decimalRange: 5)],
          textCapitalization: TextCapitalization.sentences,

          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          //onTap: () => context.read<CalculateKgCubit>().addKg(context),
          onChanged: (value) =>
              BlocProvider.of<CalculateKgCubit>(context).updateKg(value),
        );
      },
    );
  }
}
