import 'package:caspa_v2/infrastructure/cubits/ads_cubit/ads_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/ads_cubit/ads_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/ads_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/ads_list.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../../../util/screen/alert.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () => context.read<AdsCubit>()..fetch(false),
      child: BlocBuilder<AdsCubit, AdsState>(
        builder: (context, state) {
          if (state is AdsSuccess) {
            List<Data>? adsList = state.adsList.reversed.toList();
            if (adsList.first.is_active == false) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                await Alert.show(
                  context,
                  title: adsList.first.title,
                  buttonText: "Tanış oldum 😎",
                  onTap: () {
                    print(adsList.first.id);
                    context.read<AdsCubit>().sendIsActive(adsList.first.id!);
                  },
                  content: adsList.first.description,
                  image: SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.network(adsList.first.image.toString()),
                  ),
                );
              });
            }
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
