import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/more_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../util/screen/sheet.dart';
import 'widgets/bitrhday_sheet_widget.dart';
import 'widgets/home_header.dart';
import 'widgets/home_whatsapp_button.dart';
import 'widgets/news_list_widget.dart';
import 'widgets/home_package_list.dart';
import 'widgets/section_name.dart';
import 'widgets/tariffs.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

HiveService get _prefsLocale => locator<HiveService>();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      issheetShown = prefs.getBool('show_sheet') ?? false;
      setState(() {});
    });
  }

  void showSheetWidget() {
    if (!issheetShown) {
      if (_prefsLocale.user.birthday!.substring(0, 5) ==
          DateFormat("dd-MM").format(now)) {
        Future.delayed(Duration(seconds: 1), () {
          modalBottomSheetMenu(context);
        });
        issheetShown = true;
        _prefs!.setBool('show_sheet', issheetShown);
      }

    }
  }

  bool issheetShown = true;
  SharedPreferences? _prefs;
  final ScrollController _scrollController = ScrollController();
  var now = DateTime.now();

  Widget build(BuildContext context) {
    ///burdaki tarix deyishecek

    showSheetWidget();
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
                  tile: MoreButton(onTap: () => modalBottomSheetMenu(context)),
                ),
                MySizedBox.h10,
                Tariffs(),
                MySizedBox.h80,
              ],
            ),
            HomeWhatsappWidget(scrollController: _scrollController),
          ],
        ),
      ),
    );
  }
}

modalBottomSheetMenu(context) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) async {
      Sheet.display(
        context: context,
        child: BirthdaySheet(),
      );
    },
  );
}
