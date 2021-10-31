import 'package:caspa_v2/presentation/page/address_page/widget/copiable_field.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

import 'widget/turkey_anbar.dart';

class SilverAppBarExample extends StatefulWidget {
  SilverAppBarExample({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SilverAppBarExampleState createState() => new _SilverAppBarExampleState();
}

class _SilverAppBarExampleState extends State<SilverAppBarExample>
    with SingleTickerProviderStateMixin {
  final List<Widget> tabPages = <Widget>[
    TurkeyAnbar(),
    Text('second'),
    Text('third')
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
      child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    leading: Container(),
                    expandedHeight: 300.0,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    stretch: true,
                    floating: true,
                    stretchTriggerOffset: 300,
                    leadingWidth: 0,
                    elevation: 0,
                    backwardsCompatibility: true,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Positioned(
                              left: 0,
                              top: 8,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: Container(
                                    height: 30, width: 30, child: BackButton()),
                              ),
                            ),
                            Positioned(
                              //left: 0,
                              //right: 0,
                              top: 70,
                              left: 20,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Text('''Ünvanlar''',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.coHead400.copyWith(
                                        color: Colors.black, fontSize: 24)),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 76.0),
                                child: Image.asset(Assets.pngGlobus),
                              ),
                            ),
                            Positioned(
                              //top: 100,
                              left: 20,
                              // alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width-40,
                                  child: Text(
                                    "Hörmətli müştəri, əlavə məlumat əldə etmək üçün qaynar xətt: *1453",
                                    // overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: AppTextStyles.coHead400.copyWith(
                                        fontSize: 16, color: MyColors.grey165),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      centerTitle: true,
                      title: Container(
                        color: Colors.transparent,
                        width: double.maxFinite,
                        height: 300,
                        child: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Positioned(
                                left: 0,
                                top: 8,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      child: BackButton()),
                                ),
                              ),
                              Positioned(
                                //left: 0,
                                //right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 2.0, top: 15),
                                  child: Text('''Ünvanlar''',
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.sanF400
                                          .copyWith(color: Colors.black)),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    floating: false,
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        controller: _tabController,
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
                            text: 'Türkiyə',
                            height: 70,
                          ),
                          Tab(
                            text: 'Türkiyə',
                          ),
                          Tab(
                            text: 'Türkiyə',
                          ),
                        ],
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: tabPages.map((Widget widget) {
                  return widget;
                }).toList(),
              ))),
    ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }
  //test

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
