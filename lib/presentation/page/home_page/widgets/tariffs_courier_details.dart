import 'package:caspa_v2/infrastructure/cubits/tarif/courier_tariff/courier_tariff_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
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

import '../../../../infrastructure/cubits/courier/courier_cubit.dart';
import '../../../../infrastructure/cubits/tarif/courier_tariff/courier_tariff_state.dart';
import '../../calculate_page/widgets/news_calculate.dart';
import 'tariffs_courier_list_widget.dart';

class CourierTariffDetails extends StatelessWidget {
  final List<Region> hList;

  CourierTariffDetails({
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
      body: BlocBuilder<CourierTarifCubit, CourierTarifState>(
        builder: (context, state) {
          if (state is CourierTarifSuccess) {
            List<Region>? tarifList = state.tarifList;
            return CourierTarifListWidget(
              hList: tarifList,
              isVertical: true,
            );
          } else if (state is CourierTarifInProgress) {
            return CaspaLoading();
          } else if (state is CourierTarifNetworkError) {
            return EmptyWidget();
          } else {
            return EmptyWidget();
          }
        },
      ),
    );
  }
}
