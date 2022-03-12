import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_capacity/calculate_capacity_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_capacity/calculate_capacity_state.dart';
import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/general/MyMessage.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/calculate_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/models/remote/response/capacity_model.dart';
import 'calculate_capacity_button.dart';
import 'fields/height_field.dart';
import 'fields/lenght_field.dart';
import 'fields/width_field.dart';
import 'news_calculate.dart';
import 'result_calculate.dart';

class CapacityPage extends StatelessWidget {
  const CapacityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          WidthField(),
          LenghtField(),
          HeightField(),
          SectionName(title: "Hesablamanın nəticəsi:",),
          MySizedBox.h16,
          BlocBuilder<CalculateCapacityCubit, CalculateCapacityState>(
            builder: (context, state) {
              if (state is CalculateCapacityAdded) {
                 final int? result = state.price;
                return ResultCalculate(result: result.toString());
              } else if (state is CalculateCapacityInAdding) {
                return CaspaLoading();
              } else if (state is CalculateCapacityError) {
                return ResultCalculate(result: "0");
              } else if (state is CalculateCapacityNotAdded) {
                return ResultCalculate(result: "0");
              }
              return ResultCalculate(result: "0");
            },
          ),
          MySizedBox.h32,
          SectionName(title: "Xəbəriniz olsun  ‍✈️️",),
          MySizedBox.h12,
          DescriptionTextWidget(text: MyText.info,),
          MySizedBox.h40,
          CalculateCapacityButton(),
          MySizedBox.h30,
        ],
      ),
    );
  }
}
