import 'package:caspa_v2/presentation/page/contact_us_page/contact_us_page.dart';
import 'package:caspa_v2/presentation/page/new_order_link_page/link_tab.dart';
import 'package:caspa_v2/presentation/page/promo_code_page/promo_code_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/elements/menu_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/other_shop_widget.dart';

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
      body: ListView(
        padding: Paddings.paddingA16 + Paddings.paddingB90,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Menu",
              style: UITextStyle.tW400BigBlack,
            ),
          ),
          MySizedBox.h14,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuBox(
                title: "Promokod 🎉",
                content: "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                color: MyColors.promokodColor,
                onTap: () {
                  Go.to(context, PromoCodePage());
                },
              ),
              MenuBox(
                title: "Partnyorlar ⚙️",
                content: "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                color: MyColors.partnyoColor,
              ),
            ],
          ),
          MySizedBox.h14,
          const OtherShopWidget(),
          MySizedBox.h16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuBox(
                title: "Etibarnamə ⚙️",
                content: "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                color: MyColors.etibarname,
              ),
              MenuBox(
                title: "Əlaqə ☎️",
                content: "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                color: MyColors.contact,
                onTap: () {
                  Go.to(context, ContactPage());
                },
              ),
            ],
          ),
          MySizedBox.h16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuBox(
                title: "Kuryer 🕺🏻",
                content: "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                color: MyColors.kuryer,
              ),
              MenuBox(
                title: "Ayarlar ⚙️",
                content: "Tətbiqetmənin ayarlarında düzəliş etmək üçün",
                color: MyColors.settings,
              ),
            ],
          )
        ],
      ),
    );
  }
}
