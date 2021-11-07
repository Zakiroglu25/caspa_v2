import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/info_page.dart';
import 'widget/status_items.dart';

class PackageDetailsPage extends StatelessWidget {

  String ? name;


  PackageDetailsPage({required this.name});

  final tabs = [
    Tab(
      text: 'Status',
      height: 65.sm,
    ),
    Tab(
      text: 'Məlumat',
    ),
  ];
  final tabPages = [
    StatusTab(),
    InfoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SliverCaspaBar(
          tabs: tabs,
          tabPages: tabPages,
          title: name,
          back: true,
          appbarHeight: 1,
          sliverChild: Container(),
        ),
      ),
    );
  }
}
