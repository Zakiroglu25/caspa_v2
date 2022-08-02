import 'package:caspa_v2/presentation/page/other_page/widget/add_address_widget.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/elements/menu_box.dart';
import 'package:flutter/material.dart';

import 'widget/other_shop_widget.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final boxW = (MediaQuery.of(context).size.width / 2) - 24;
    return Scaffold(
        appBar: CaspaAppbar(
          contextA: context,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuBox(
                  w: boxW,
                  title: MyText.promoCodeX,
                  content: MyText.promocodeContent,
                  color: MyColors.promokodColor,
                  onTap: () => Go.to(context, Pager.promoCode),
                ),
                MenuBox(
                  w: boxW,
                  title: MyText.giftBalanceX,
                  content: MyText.infoGift,
                  color: MyColors.partnyoColor,
                  onTap: () {
                    Go.to(context, Pager.giftBalance);
                  },
                ),
              ],
            ),
            MySizedBox.h14,
            const OtherShopWidget(),
            MySizedBox.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuBox(
                  w: boxW,
                  title: MyText.attorneyX,
                  content: MyText.attorneyContent,
                  color: MyColors.etibarname,
                  onTap: () => Go.to(context, Pager.attorney),
                ),
                MenuBox(
                  w: boxW,
                  title: MyText.contactX,
                  content: MyText.contactTitle,
                  color: MyColors.contact,
                  onTap: () => Go.to(context, Pager.contact),
                ),
              ],
            ),
            MySizedBox.h16,
            const OtherAddAddressWidget(),
            MySizedBox.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuBox(
                  w: boxW,
                  title: MyText.courierX,
                  content: MyText.courierInfo,
                  color: MyColors.kuryer,
                  onTap: () => Go.to(context, Pager.courierList),
                ),
                MenuBox(
                  w: boxW,
                  title: MyText.calculate,
                  content: MyText.calculateTitle,
                  color: MyColors.promokodColor,
                  onTap: () => Go.to(context, Pager.calculate),
                ),
              ],
            ),
            MySizedBox.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuBox(
                  w: boxW,
                  title: MyText.trendyolSms,
                  content: MyText.trendyolOtp,
                  color: MyColors.shop,
                  onTap: () => Go.to(context, Pager.smsCodes),
                ),
                MenuBox(
                  w: boxW,
                  title: MyText.settingsX,
                  content: MyText.forEditAppSettings,
                  color: MyColors.grey245,
                  onTap: () => Go.to(context, Pager.settings),
                ),
              ],
            ),
          ],
        ));
  }
}
