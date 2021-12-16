import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import 'widgets/home_header.dart';
import 'widgets/news_list_widget.dart';
import 'widgets/package_list.dart';
import 'widgets/section_name.dart';
import 'widgets/tariffs.dart';

class HomePage extends StatelessWidget {
  PreferencesService get _prefs => locator<PreferencesService>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: _prefs.user.name!+" "+ _prefs.user.surname!,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: Paddings.paddingB12 + Paddings.paddingT14,
          children: [
            GestureDetector(
                onTap: () {
                  //   BlocProvider.of<AuthenticationCubit>(context).logOut(context);
                  context.read<AuthenticationCubit>()..logOut(context);
                },
                child: HomeHeader()),
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
