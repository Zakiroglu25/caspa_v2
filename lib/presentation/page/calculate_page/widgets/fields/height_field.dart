import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_capacity/calculate_capacity_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightField extends StatelessWidget {
  final TextEditingController? controller;

  const HeightField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
       stream: BlocProvider.of<CalculateCapacityCubit>(context).height,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.height_under,
          maxLines: 1,
          hint: MyText.height_hint,
          upperCase: true,
          textInputType: TextInputType.number,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<CalculateCapacityCubit>(context).updateHeight(value),
        );
      },
    );
  }
}
