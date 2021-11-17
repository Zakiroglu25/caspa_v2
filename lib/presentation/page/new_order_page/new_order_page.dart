import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/declare_tab.dart';
import 'widgets/link_tab.dart';

class NewOrderPage extends StatefulWidget {
  @override
  State<NewOrderPage> createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Widget> tabPages = <Widget>[
    LinkTab(),
    DeclareTab(),
  ];

  final List<Widget> tabs = const [
    Tab(
      text: 'Link ilə',
      height: 55,
    ),
    Tab(
      text: 'Bəyan et',
    ),
  ];

  @override
  void initState() {
    // initialise your tab controller here

    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/png/bck.png"),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 65,
                            left: 65,
                            right: 65,
                            child: SizedBox(
                              child: Image.asset(
                                'assets/png/moto.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                expandedHeight: MediaQuery.of(context).size.height / 2,
                bottom: TabBar(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyColors.mainColor),
                  labelColor: Colors.white,
                  unselectedLabelColor: MyColors.grey153,
                  tabs: [
                    Tab(text: 'Link ile'),
                    Tab(text: 'Beyan et'),
                  ],
                  controller: _tabController,
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              LinkTab(),
              Text("sagol"),
            ],
          )),
    );
  }
}
