import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/presentation/page/address_page/address_page.dart';
import 'package:caspa_v2/presentation/page/home_page/home_page.dart';
import 'package:caspa_v2/presentation/page/new_order_page/new_order_page.dart';
import 'package:caspa_v2/presentation/page/other_page/other_page.dart';
import 'package:caspa_v2/presentation/page/package_page/package_page.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widget/bottom_element.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int index = 0;

  final pages = <Widget>[
    Pager.home,
    PackagePage(),
    NewOrderPage(),
    AdressPage(),
    Pager.other,
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _key,
        extendBody: true,
        body: pages[index],
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: MyColors.mainColor01,
            highlightColor: MyColors.mainColor02,

            // highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 10,
            unselectedFontSize: 11,
            selectedFontSize: 11,

            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: Container(
                    margin: EdgeInsets.only(bottom: 0),
                    child: SvgPicture.asset(Assets.svgHome,
                        color: MyColors.mainColor)),
                icon: SvgPicture.asset(Assets.svgHome),
                label: 'Əsas',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: SvgPicture.asset(
                  Assets.svgBottomBox,
                  color: MyColors.mainColor,
                ),
                icon: SvgPicture.asset(Assets.svgBottomBox),
                label: 'Bağlamalar',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: SvgPicture.asset(Assets.svgPlusCircle,
                    color: MyColors.mainColor),
                icon: SvgPicture.asset(
                  Assets.svgPlusCircle,
                ),
                label: 'Yeni sifariş',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: SvgPicture.asset(Assets.svgLocation,
                    color: MyColors.mainColor),
                icon: SvgPicture.asset(
                  Assets.svgLocation,
                ),
                label: 'Ünvanlar',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                activeIcon: SvgPicture.asset(Assets.svgOther,
                    color: MyColors.mainColor),
                icon: SvgPicture.asset(
                  Assets.svgOther,
                ),
                label: 'Digər',
              ),
            ],
            currentIndex: index,
            onTap: onChangedTab,
            selectedItemColor: MyColors.black,
          ),
        ),
      );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
