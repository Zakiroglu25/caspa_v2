import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateKgButton extends StatelessWidget {
  const CalculateKgButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<CalculateKgCubit>(context).kg,
      builder: (context, snp) {
        return AppButton(
          isButtonActive: snp.hasData,
          text: MyText.apply,
          loading:
              (context.watch<CalculateKgCubit>().state is CalculateKgInAdding),
          onTap: () {
            context.read<CalculateKgCubit>().addKg(context);
            //FocusManager.instance.primaryFocus?.unfocus();
          },
        );
      },
    );
  }
}
