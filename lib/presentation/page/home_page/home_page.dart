import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/more_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infrastructure/cubits/ads_cubit/ads_cubit.dart';
import '../../../infrastructure/cubits/tarif/tarif_cubit.dart';
import 'widgets/home_header.dart';
import 'widgets/news_list_widget.dart';
import 'widgets/home_package_list.dart';
import 'widgets/section_name.dart';
import 'widgets/tariffs.dart';
import 'widgets/tariffs_courier.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        contextA: context,
        // title: _prefs.user.name! + " " + _prefs.user.surname!,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: Paddings.paddingB12 + Paddings.paddingT14,
          children: [
            HomeHeader(),
            MySizedBox.h12,
            SectionName(
              title: "Kuryer tarifləri",
              hP: 20,
              tile: MoreButton(
                onTap: () => Go.to(context, Pager.courierTarifDetails),
              ),
            ),
            MySizedBox.h12,
            TariffsCourier(),
            MySizedBox.h12,
            SectionName(
              title: "Yeniliklər və xəbərləri izləyin",
              hP: 20,
            ),
            MySizedBox.h16,
            Ads(),
            MySizedBox.h24,
            SectionName(
              title: MyText.activePackages,
              hP: 20,
            ),
            MySizedBox.h16,
            BlocProvider(
              create: (context) => PackageCubit()..fetchActive(),
              child: HomePackageList(),
            ),
            MySizedBox.h16,
            SectionName(
              title: MyText.recognizeTariffs,
              hP: 20,
              tile: MoreButton(
                onTap: () => Go.to(context, Pager.tarifDetails),
              ),
            ),
            MySizedBox.h10,
            Tariffs(),
          ],
        ),
      ),
    );
  }
}
