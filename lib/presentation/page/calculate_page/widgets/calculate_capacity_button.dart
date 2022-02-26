import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_capacity/calculate_capacity_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_state.dart';
import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateCapacityButton extends StatelessWidget {
  const CalculateCapacityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<CalculateCapacityCubit>(context).lenght,
      builder: (context, snp) {
        return CaspaButton(
          isButtonActive: snp.hasData,
          text: MyText.apply,
          loading: (context.watch<CalculateCapacityCubit>().state is CalculateKgInAdding),
          onTap: () => context.read<CalculateCapacityCubit>().capacity(context),
        );
      },
    );
  }
}
