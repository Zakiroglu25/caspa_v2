import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/capacity_tab.dart';
import 'widgets/kg_tab.dart';


class CalculatePage extends StatelessWidget {
  final List<Widget> tabPages = <Widget>[
    KgPage(),
    CapacityPage(),
  ];

  final List<Widget> tabs = const [
    Tab(
      text: MyText.kg_text,
      height: 55,
    ),
    Tab(
      text: MyText.capacity_text,
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
            selectedLabelColor: MyColors.black34,
            selectedTabColor: MyColors.grey245,
            title: MyText.calculate_appbar,
            sliverChild: Container(),
          ),
        ));
  }
}
