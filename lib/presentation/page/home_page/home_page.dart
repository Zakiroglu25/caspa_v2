import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_state.dart';
import 'package:caspa_v2/infrastructure/models/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_header.dart';
import 'widgets/news_list_widget.dart';
import 'widgets/package_list.dart';
import 'widgets/section_name.dart';
import 'widgets/tarif_list_widget.dart';
import 'widgets/tariffs.dart';

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
            Tariffs(),
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
