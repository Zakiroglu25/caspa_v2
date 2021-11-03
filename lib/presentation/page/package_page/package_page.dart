import 'package:caspa_v2/presentation/page/package_page/widget/sliver_appbar.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'widget/header.dart';
import 'widget/history_package_page.dart';
import 'widget/package_waiting_page.dart';
import 'widget/sliver_appbar_delegate.dart';

class PackagePage extends StatefulWidget {
  PackagePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _PackagePageState createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBarWidget(),
              SliverPersistentHeaderWidget(tabController: _tabController,)
            ];
          },
          body: TabBarView(controller: _tabController, children: [
            ///gozlemede olan
            WaitingPackagePage(),

            ///tarixce
            HistoryPackage(),
          ]),
        ),
      ),
    );
  }
}