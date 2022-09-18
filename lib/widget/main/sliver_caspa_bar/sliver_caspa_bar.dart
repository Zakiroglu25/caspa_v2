import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:flutter/material.dart';

import 'widgets/sliver_back.dart';
import 'widgets/sliver_body.dart';
import 'widgets/sliver_notification.dart';
import 'widgets/sliver_title.dart';
import 'widgets/sliver_title_top.dart';

class SliverCaspaBar extends StatefulWidget {
  final List<Widget>? tabs;
  final List<Widget>? tabPages;
  final EdgeInsets? tabbarPadding;
  final Color? selectedTabColor;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final int? first;
  final RefreshCallback? onRefresh;
  final String? title;
  final Widget? sliverChild;
  final double? appbarHeight;
  final bool? back;
  final bool? notification;
  final bool? isScrollable;
  final Function(int)? tabController;

  const SliverCaspaBar({
    Key? key,
    this.tabs,
    this.tabPages,
    this.title,
    this.onRefresh,
    this.tabbarPadding,
    this.tabController,
    this.selectedTabColor,
    this.unSelectedLabelColor,
    this.isScrollable,
    this.first,
    this.selectedLabelColor,
    this.back,
    this.notification,
    this.appbarHeight,
    this.sliverChild,
  }) : super(key: key);

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
    _tabController!.addListener(() {
      widget.tabController?.call(_tabController!.index);
    });

    if (widget.first != null && widget.first != -1) {
      _tabController!.animateTo(widget.first!);
    }
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
                  flexibleSpace: FadeIn(
                    child: FlexibleSpaceBar(
                      background: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            SliverBack(back: widget.back),
                            SliverNotification(widget.notification),
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
                              SliverBack(
                                back: widget.back,
                              ),
                              SliverNotification(widget.notification),
                              SliverTitleTop(widget.title)
                            ]),
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  floating: false,
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      padding: widget.tabbarPadding ??
                          const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 10),
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        color: widget.selectedTabColor ?? MyColors.mainGrey,
                      ),
                      labelColor:
                          widget.selectedLabelColor ?? MyColors.textBlack,
                      unselectedLabelColor:
                          widget.unSelectedLabelColor ?? MyColors.grey153,
                      physics: Physics.alwaysBounce,
                      tabs: widget.tabs!,
                      //indicatorSize: TabBarIndicatorSize(),
                      isScrollable: widget.isScrollable ?? false,
                    ),
                  ),
                )
              ];
            },
            body: FadeIn(
              child: TabBarView(
                physics: Physics.alwaysBounce,
                controller: _tabController,
                children: widget.tabPages!.map((Widget child) {
                  return RefreshIndicator(
                      color: MyColors.mainColor,
                      onRefresh: () async => widget.onRefresh?.call(),
                      child: child);
                }).toList(),
              ),
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
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  //test

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}

class NoScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
