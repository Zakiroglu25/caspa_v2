import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'widget/history_package_page.dart';
import 'widget/package_sliver_body.dart';
import 'widget/package_waiting_page.dart';

class PackagePage extends StatelessWidget {
  final List<Widget> tabPages = <Widget>[
    WaitingPackagePage(),
    HistoryPackage(),
  ];

  final List<Widget> tabs = const [
    Tab(
      text: 'Gözləmədə olan',
      height: 65,
    ),
    Tab(
      text: 'Tarixçə',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
      child: SliverCaspaBar(
        appbarHeight: 355,
        tabs: tabs,
        tabPages: tabPages,
        title: '''Bağlamalar''',
        sliverChild: PackageSliverBody(),
      ),
    ));
  }
}
