import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/tabs/info_page.dart';
import 'widget/status_items.dart';

class PackageDetailsPage extends StatelessWidget {
  final Package? package;

  PackageDetailsPage({required this.package});

  final tabs = [
    Tab(
      text: 'Status',
      height: 65.sm,
    ),
    Tab(
      text: 'Məlumat',
    ),
  ];

  //  List<Widget> tabPages = [
  //   StatusTab(),
  //   InfoTab(package: package!,),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: package!.store,
        color: MyColors.yellow255,
        notification: false,
      ),
      body: SafeArea(
        child: InfoTab(
          package: package!,
        ),
      ),
    );
  }
}
