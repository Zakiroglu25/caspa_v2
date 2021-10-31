
import 'package:caspa_v2/presentation/page/address_page/address_page.dart';
import 'package:caspa_v2/presentation/page/home_page/home_page.dart';
import 'package:caspa_v2/presentation/page/package_page/package_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
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
    HomePage(),
    PackagePage(),
    Text("burda sifarish olacq"),
    SilverAppBarExample(),
    PackagePage(),
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
    key: _key,
    extendBody: true,
    body: pages[index],
    bottomNavigationBar: Theme(
      data: ThemeData(
        splashColor: MyColors.mainColor,
        highlightColor: MyColors.mainColor,

        // highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        elevation: 0,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: SvgPicture.asset("assets/svg/home.svg",color: MyColors.mainColor),
            icon: SvgPicture.asset('assets/svg/home.svg'),
            label: 'Əsas',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: SvgPicture.asset('assets/svg/box.svg',color: MyColors.mainColor,),
            icon: SvgPicture.asset('assets/svg/box.svg'),
            label: 'Bağlamalar',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon:SvgPicture.asset('assets/svg/pluscircle.svg',color: MyColors.mainColor),
            icon: SvgPicture.asset('assets/svg/pluscircle.svg',),
            label: 'Yeni sifariş',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: SvgPicture.asset('assets/svg/location.svg',color: MyColors.mainColor),
            icon: SvgPicture.asset('assets/svg/location.svg',),
            label: 'Ünvanlar',
          ),BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: SvgPicture.asset('assets/svg/other.svg',color: MyColors.mainColor),
            icon: SvgPicture.asset('assets/svg/other.svg',),
            label: 'Digər',
          ),
        ],
        currentIndex: index,
        onTap: onChangedTab,
        selectedItemColor: MyColors.mainColor,
      ),
    ),

  );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}

// class CustomListTile extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final Function onTap;
//
//   CustomListTile(this.icon, this.text, this.onTap);
//
//   @override
//   Widget build(BuildContext context) {
//     //ToDO
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
//         child: InkWell(
//             splashColor: Colors.orangeAccent,
//             // onTap: onTap,
//             child: Container(
//                 height: 40,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Icon(icon),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                         ),
//                         Text(
//                           text,
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                     Icon(Icons.arrow_right)
//                   ],
//                 ))),
//       ),
//     );
//   }
// }
