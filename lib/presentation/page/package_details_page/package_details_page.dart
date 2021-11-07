import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/info_page.dart';
import 'widget/status_items.dart';



class PackageDetailsPage extends StatefulWidget {
  const PackageDetailsPage({Key? key}) : super(key: key);

  @override
  State<PackageDetailsPage> createState() => _PackageDetailsPageState();
}

class _PackageDetailsPageState extends State<PackageDetailsPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: MyColors.grid6,
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text("Baglama"),
          elevation: 0,
          backgroundColor: MyColors.grid6,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SvgPicture.asset(Assets.menuAppbar),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24), topLeft: Radius.circular(24))),
          child: Column(
            children: [
              MySizedBox.h10,
              Container(
                width: 33,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100)),
              ),
              MySizedBox.h16,
              TabBar(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  controller: _controller,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    color: MyColors.mainGrey,
                  ),
                  labelColor: MyColors.textBlack,
                  unselectedLabelColor: MyColors.grey153,
                  tabs: const [
                    Tab(
                      text: 'Status',
                    ),
                    Tab(
                      text: 'Məlumat',
                    ),
                  ]),
              Expanded(
                child: TabBarView(
                  controller: _controller,
                  children: [
                    StatusItems(),
                    Info(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

