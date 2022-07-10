import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/more_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import 'widgets/home_header.dart';
import 'widgets/home_whatsapp_button.dart';
import 'widgets/news_list_widget.dart';
import 'widgets/home_package_list.dart';
import 'widgets/section_name.dart';
import 'widgets/tariffs.dart';

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  HiveService get _prefs => locator<HiveService>();

  var date = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        contextA: context,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              shrinkWrap: true,
              padding: Paddings.paddingB12 + Paddings.paddingT14,
              children: [
                HomeHeader(),
                MySizedBox.h36,
                SectionName(
                  title: "Yeniliklər və xəbərləri izləyin",
                  hP: 20,
                ),
                MySizedBox.h16,
                Ads(),
                MySizedBox.h36,
                SectionName(
                  title: MyText.activePackages,
                  hP: 20,
                ),
                MySizedBox.h16,
                BlocProvider(
                  create: (context) => PackageCubit()..fetchActive(),
                  child: HomePackageList(),
                ),
                MySizedBox.h36,
                SectionName(
                  title: MyText.recognizeTariffs,
                  hP: 20,
                  tile: MoreButton(
                    onTap: () => Go.to(context, Pager.tarifDetails),
                  ),
                ),
                MySizedBox.h10,
                Tariffs(),
                MySizedBox.h80,
              ],
            ),
            HomeWhatsappWidget(scrollController: _scrollController),
            ///bu ad gunu ile elaqeder olaraq bottomsheete acmaqdir
            // Column(
            //   children: [
            // if (_prefs.user.birthday!.substring(0,5) == DateFormat("dd-MM").format(DateTime.now()))
            //
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
