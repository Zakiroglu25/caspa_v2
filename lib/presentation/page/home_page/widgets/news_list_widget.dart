import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/ads_cubit/ads_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/ads_cubit/ads_state.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/ads_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/ads_list.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/tarif_list_widget.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:caspa_v2/widget/general/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () => context.read<AdsCubit>()..fetch(false),
      child: BlocBuilder<AdsCubit, AdsState>(
        builder: (context, state) {
          if (state is AdsSuccess) {
            List<Data>? adsList = state.adsList.reversed.toList();
            return AdsWidget(hList: adsList);
          } else if (state is AdsInProgress) {
            return CaspaLoading(
              s: 92.sp,
            );
          } else if (state is AdsInProgress) {
            return CaspaLoading(
              s: 92.sp,
            );
          } else {
            return EmptyWidget();
          }
        },
      ),
    );
  }
}
