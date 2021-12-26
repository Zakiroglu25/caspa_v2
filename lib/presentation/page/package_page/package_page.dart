import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'widget/tabs/package_history_tab.dart';
import 'widget/package_sliver_body.dart';
import 'widget/tabs/waiting_package_tab.dart';

class PackagePage extends StatelessWidget {
  final List<Widget> tabPages = <Widget>[
  Pager.waitingPackages,
  Pager.packagesHistory,
  ];

  final List<Widget> tabs = const [
    Tab(
      text: MyText.in_waiting,
      height: 65,
    ),
    Tab(
      text: MyText.history,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
      child: SliverCaspaBar(
        appbarHeight: 355,
        tabs: tabs,
        tabPages: tabPages,
        title: MyText.packages,
        sliverChild: PackageSliverBody(),
      ),
    ));
  }
}
