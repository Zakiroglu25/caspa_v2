import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/tarif_list_widget.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../infrastructure/cubits/tarif/courier_tariff/courier_tariff_cubit.dart';
import '../../../../infrastructure/cubits/tarif/courier_tariff/courier_tariff_state.dart';
import 'tariffs_courier_list_widget.dart';

class TariffsCourier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierTarifCubit, CourierTarifState>(
      builder: (context, state) {
        if (state is CourierTarifSuccess) {
          List<Region>? tarifList = state.tarifList;
          return CourierTarifListWidget(
            hList: tarifList,
          );
        } else if (state is CourierTarifInProgress) {
          return CaspaLoading(s: 92.sp,);
        } else if (state is CourierTarifNetworkError) {
          return EmptyWidget();
        } else {
          return EmptyWidget();
        }
      },
    );
  }
}
