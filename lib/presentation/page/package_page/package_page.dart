import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() =>  _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  final List<Widget> tabPages = <Widget>[
    Text('first'),
    Text('second'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this,
        length: 2
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
        body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                        expandedHeight: 310,
                        floating: true,
                        pinned: false,
                        snap: true,
                        elevation: 0,
                        backgroundColor: Colors.white,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          background: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Bağlamalar",
                                  style: TextStyle(fontSize: 25),
                                ),
                                Image.asset("assets/png/boxpng.png"),
                                Padding(
                                  padding: const EdgeInsets.only(right: 32.0),
                                  child: Text(
                                      "Hörmətli müştəri, bu bölmədə olan bağlamalar sizə qısa zamanda çatdırılacaq. Əlavə məlumat əldə etmək üçün qaynar xətt: *1453",style: TextStyle(fontSize: 14),),
                                ),
                                MySizedBox.h12,
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(159, 44),
                                      primary: MyColors.mainColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12))),
                                  onPressed: () {
                                    //NavigateUtils.pushReplacement(context, LandingPage());
                                  },
                                  child: const Text(
                                    "Qeydiyyat",
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                MySizedBox.h30,
                              ],
                            ),
                          ),),),
                    SliverPersistentHeader(

                      floating: false,
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        TabBar(
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
                              text: 'Gözləmədə olan',
                            ),
                            Tab(
                              text: 'Tarixcə',
                            ),
                          ],
                        ),
                      ),
                    )
                  ];
                }, body: TabBarView(
              controller: _tabController,
              children: [
                Text("Salam"),
                Text("Sagol"),
              ]
            ))
        )
    );
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
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return  Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}