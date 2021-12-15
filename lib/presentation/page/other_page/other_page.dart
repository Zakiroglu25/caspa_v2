import 'package:caspa_v2/presentation/page/contact_us_page/contact_us_page.dart';
import 'package:caspa_v2/presentation/page/etibarname_page/etibarname_page.dart';
import 'package:caspa_v2/presentation/page/gift_balance_page/gift_balance_page.dart';

import 'package:caspa_v2/presentation/page/promo_code_page/promo_code_page.dart';

import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/elements/menu_box.dart';
import 'package:flutter/material.dart';
import 'widget/other_shop_widget.dart';

class OtherPage extends StatelessWidget {
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
              MyText.menu,
              style: UITextStyle.tW400BigBlack,
            ),
          ),
          MySizedBox.h14,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuBox(
                title: MyText.promoCodeX,
                content: MyText.forEditAppSettings,
                color: MyColors.promokodColor,
                onTap: () => Go.to(context, PromoCodePage()),
              ),
              MenuBox(
                title: MyText.giftBalanceX,
                content: MyText.forEditAppSettings,
                color: MyColors.partnyoColor,
                onTap: () {
                  Go.to(context, GiftBalance());
                },
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
                title: MyText.powerOfAttorney,
                content: MyText.forEditAppSettings,
                color: MyColors.etibarname,
                onTap: () {
                  Go.to(context, EtibarnamePage());
                },
              ),
              MenuBox(
                title: MyText.contactX,
                content: MyText.forEditAppSettings,
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
                title: MyText.courierX,
                content: MyText.forEditAppSettings,
                color: MyColors.kuryer,
                onTap: () {
                 // Go.to(context, KuryerPage());
                },
              ),
              MenuBox(
                title: MyText.settingsX,
                content: MyText.forEditAppSettings,
                color: MyColors.settings,
                onTap: () {
                  Go.to(context, SettingsPage());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
