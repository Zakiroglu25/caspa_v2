import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/widget/caspa_appbar/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/sliver_back.dart';
import 'widgets/sliver_body.dart';
import 'widgets/sliver_notification.dart';
import 'widgets/sliver_title.dart';
import 'widgets/sliver_title_top.dart';

class SliverCaspaBar extends StatefulWidget {
  List<Widget>? tabs;
  List<Widget>? tabPages;

  String? title;
  Widget? sliverChild;
  double? appbarHeight;

  SliverCaspaBar(
      {this.tabs,
      this.tabPages,
      this.title,
      this.sliverChild,
      this.appbarHeight});

  @override
  State<SliverCaspaBar> createState() => _SliverCaspaBarState();
}

class _SliverCaspaBarState extends State<SliverCaspaBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.tabs!.length);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.tabs!.length,
        child: NestedScrollView(
            physics: Physics.never,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leading: Container(),
                  expandedHeight: widget.appbarHeight ?? 300.0,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  stretch: false,
                  floating: true,
                  stretchTriggerOffset: widget.appbarHeight ?? 300,
                  leadingWidth: 0,
                  elevation: 0,
                  backwardsCompatibility: false,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          SliverBack(),
                          SliverNotification(),
                          SliverTitle(widget.title),
                          SliverBody(widget.sliverChild),
                        ]),
                    centerTitle: true,
                    title: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      height: 300,
                      child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            SliverBack(),
                            SliverNotification(),
                            SliverTitleTop(widget.title)
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
                          left: 20, right: 20, top: 5, bottom: 10),
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        color: MyColors.mainGrey,
                      ),
                      labelColor: MyColors.textBlack,
                      unselectedLabelColor: MyColors.grey153,
                      physics: Physics.alwaysBounce,
                      tabs: widget.tabs!,
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
              physics: Physics.never,
              controller: _tabController,
              children: widget.tabPages!.map((Widget widget) {
                return widget;
              }).toList(),
            )));
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

class NoScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
