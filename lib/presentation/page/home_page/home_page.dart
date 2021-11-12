import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/models/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_header.dart';
import 'widgets/news_list_widget.dart';
import 'widgets/package_list.dart';
import 'widgets/section_name.dart';
import 'widgets/tarif_list_widget.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: 'User Name',
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: Paddings.paddingV20,
          children: [
            HomeHeader(),
            MySizedBox.h24,
            SectionName(
              title: "Yeniliklər və xəbərləri izləyin",
              hP: 20,
            ),
            MySizedBox.h16,
            NewsListWidget(
              hList: [],
            ),
            MySizedBox.h24,
            SectionName(
              title: "Teriflərlə tanış olun",
              hP: 20,
            ),
            MySizedBox.h16,
            BlocProvider(
              create: (context) => TarifCubit()..fetch(),
              child: BlocBuilder<TarifCubit, TarifState>(
                builder: (context, state) {
                  if (state is TarifSuccess) {
                    List<Data>? result = state.tarif.data;
                    return TarifListWidget(
                      ///bura baxarsan gor harda sehv elemisem?
                      ///resultu bura soxanniram
                      hList: [],
                    );
                  } else if (state is TarifError) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TarifUpdating) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
            MySizedBox.h24,
            SectionName(
              title: "Mənim bağlamalarim",
              hP: 20,
            ),
            MySizedBox.h24,
            HomaPackageList(),
          ],
        ),
      ),
    );
  }
}
