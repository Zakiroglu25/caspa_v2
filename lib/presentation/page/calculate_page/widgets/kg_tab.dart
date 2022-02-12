import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/calculate/calculate_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/calculate_model.dart';
import 'package:caspa_v2/presentation/page/calculate_page/widgets/fields/kg_fields.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/text_field_on_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculate_kg_button.dart';
import 'news_calculate.dart';
import 'result_calculate.dart';

class KgPage extends StatelessWidget {
  const KgPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          KgField(),
          SectionName(
            title: "Hesablamanın nəticəsi:",
          ),
          MySizedBox.h16,
          BlocBuilder<CalculateKgCubit, CalculateKgState>(
            builder: (context, state) {
              if (state is CalculateKgAdded) {
                final CalculateModel? result = state.calculate;
                return ResultCalculate(result: result!.price!.toString());
              } else if (state is CalculateKgInAdding) {
                return CaspaLoading();
              } else if (state is CalculateKgError) {
                return ResultCalculate(result: "0");
              } else if (state is CalculateKgNotAdded) {
                return ResultCalculate(result: "0");
              }
              return ResultCalculate(result: "0");
            },
          ),
          MySizedBox.h32,
          SectionName(
            title: "Xəbəriniz olsun  ‍✈️️",
          ),
          MySizedBox.h12,
          DescriptionTextWidget(
            text: MyText.info,
          ),
          MySizedBox.h40,
          CalculateKgButton(),
          MySizedBox.h30,
        ],
      ),
    );
  }
}
