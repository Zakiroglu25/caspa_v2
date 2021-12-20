import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_text_button.dart';
import 'package:caspa_v2/widget/general/more_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import 'widgets/home_header.dart';
import 'widgets/news_list_widget.dart';
import 'widgets/package_list.dart';
import 'widgets/section_name.dart';
import 'widgets/tariff_details.dart';
import 'widgets/tariffs.dart';

class HomePage extends StatelessWidget {
  PreferencesService get _prefs => locator<PreferencesService>();

  Widget build(BuildContext context) {
    // bbbb("cap et: "+(context.read<AuthenticationCubit>().userData?.name)!);
    MyUser user = context.read<AuthenticationCubit>().userData!;
    return Scaffold(
      appBar: CaspaAppbar(
        // title: "d",

        ///bunlar null gelir
        title: user.name! + " " + user.surname!,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: Paddings.paddingB12 + Paddings.paddingT14,
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
              title: MyText.recognizeTariffs,
              hP: 20,
              tile: MoreButton(
                onTap: () =>Go.to(context, Pager.tarifDetails),
              ),
            ),
            MySizedBox.h16,
            InkWell(
                onTap: () => Go.to(
                    context,
                    TariffDetails(
                      hList: [],
                    )),
                child: Tariffs()),
            MySizedBox.h24,
            SectionName(
                title: MyText.myPackages,
                hP: 20,
                tile: MoreButton(
                  onTap: () {},
                )),
            MySizedBox.h24,
            HomaPackageList(),
          ],
        ),
      ),
    );
  }
}
