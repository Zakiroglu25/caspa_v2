import 'package:caspa_v2/presentation/page/new_order_link_page/link_tab.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/elements/menu_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/menu_box_big.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Digər",
                  style: UITextStyle.tW400BigBlack,
                ),
              ),
            ),
            MySizedBox.h30,
            MenuBoxBig(
              title: "Mağazalar ",
              color: MyColors.shop,
              content:
                  "Yeni! Sifarişləri bizim mağaza bölməsindən sifariş edə bilərsiniz. Artıq əlavə tətbiqlərə gərək qalmadı 😎",
              image: "assets/png/shopmobile.png",
            ),
            MySizedBox.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MenuBox(
                  title: "Promokod 🎉",
                  content: "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                  color: MyColors.promokodColor,
                ),
                MenuBox(
                  title: "Partnyorlar ⚙️",
                  content: "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                  color: MyColors.partnyoColor,
                ),
              ],
            ),
            MySizedBox.h16,

            MenuBoxBig(
              title: "Mağazalar ",
              color: MyColors.settings,
              content:
                  "Yeni! Sifarişləri bizim mağaza bölməsindən sifariş edə bilərsiniz. Artıq əlavə tətbiqlərə gərək qalmadı 😎",
              image: '',
            ),
          ],
        ),
      ),
    );
  }
}
