import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/tarif_list_widget.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:caspa_v2/widget/general/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../calculate_page/widgets/news_calculate.dart';

class TariffDetails extends StatelessWidget {
  final List<Tariff> hList;

  TariffDetails({
    Key? key,
    required this.hList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.tariffs,
        user: false,
        contextA: context,
        notification: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            BlocBuilder<TarifCubit, TarifState>(
              builder: (context, state) {
                if (state is TarifSuccess) {
                  List<Tariff>? tarifList = state.tarifList;
                  return TarifListWidget(
                    hList: tarifList,
                    isVertical: true,
                  );
                } else if (state is TarifInProgress) {
                  return CaspaLoading();
                } else if (state is TarifNetworkError) {
                  return EmptyWidget();
                } else {
                  return EmptyWidget();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.mainColor01
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(MyText.info,style: AppTextStyles.sanF400,),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
