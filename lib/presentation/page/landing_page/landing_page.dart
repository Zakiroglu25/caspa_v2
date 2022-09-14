import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final globalPageController = PageController(initialPage: 1);

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int index = 0;

  final pages = <Widget>[
    Pager.home,
    Pager.package(),
    Pager.newOrder,
    Pager.adress,
    Pager.other,
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) => PageView(
        controller: globalPageController,
        physics: Physics.alwaysClamp,
        children: [
          Pager.userCabinet(showBack: true), //
          Scaffold(
            key: _key,
            extendBody: true,
            body: pages[index],
            bottomNavigationBar: BottomNavigationBar(
              // activeColor: MyColors.mainColor,
              backgroundColor: Colors.white,
              //elevation: 10,
              elevation: 0,
              unselectedFontSize: 11,
              selectedFontSize: 11,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: MyColors.mainColor,
              items: [
                buildBottomNavigationBarItem(
                    icon: Assets.svgHome, label: MyText.main),
                buildBottomNavigationBarItem(
                    icon: Assets.svgBottomBox, label: MyText.packages),
                buildBottomNavigationBarItem(
                    icon: Assets.svgPlusCircle, label: MyText.newOrder),
                buildBottomNavigationBarItem(
                    icon: Assets.svgLocation, label: MyText.adresses),
                buildBottomNavigationBarItem(
                    icon: Assets.svgOther, label: MyText.other),
              ],
              currentIndex: index,
              onTap: onChangedTab,
              // selectedItemColor: MyColors.black,
            ),
          )
        ],
      );

  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required String icon, required String label}) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      activeIcon: SvgPicture.asset(
        icon,
        color: MyColors.mainColor,
      ),
      icon: SvgPicture.asset(icon),
      label: label,
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
