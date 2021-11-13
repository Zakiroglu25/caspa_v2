import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/tarif_list_widget.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tariffs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TarifCubit, TarifState>(
      builder: (context, state) {
        if (state is TarifSuccess) {
          List<Tariff>? tarifList = state.tarifList;
          return TarifListWidget(
            hList: tarifList,
          );
        } else if (state is TarifInProgress) {
          return CaspaLoading();
        } else if (state is TarifNetworkError) {
          return NoData();
        } else {
          return NoData();
        }
      },
    );
  }
}
