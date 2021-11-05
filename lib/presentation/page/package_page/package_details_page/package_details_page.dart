import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/package_page/widget/history_package_page.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/info_header.dart';
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                  unselectedLabelColor: MyColors.textFieldLittleText,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoHeader(),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0,top: 35),
                          child: Column(
                            children: [
                              SectionName(title: 'Məhsullar',)

                            ],
                          ),
                        )
                      ],
                    )
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
