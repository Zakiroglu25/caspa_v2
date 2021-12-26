import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/tabs/business_register_tab.dart';
import 'widgets/tabs/civil_register_tab.dart';

class RegisterPage extends StatelessWidget {
  final List<Widget> tabPages = <Widget>[
    CivilRegisterTab(),
    BusinessRegisterTab(),
  ];

  final List<Widget> tabs = const [
    Tab(
      text: 'Vətəndaş qeydiyyatı',
      height: 55,
    ),
    Tab(
      text: 'Biznes qeydiyyat',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SliverCaspaBar(
        appbarHeight: 1,
        tabs: tabs,
        notification: false,
        back: true,
        tabbarPadding: Paddings.paddingH16 + Paddings.paddingV4,
        tabPages: tabPages,
        selectedLabelColor: MyColors.white,
        selectedTabColor: MyColors.mainColor,
        title: '''Bağlamalar''',
        sliverChild: Container(),
      ),
    ));
  }
}
