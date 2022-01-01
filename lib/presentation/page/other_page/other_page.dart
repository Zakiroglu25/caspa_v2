import 'package:caspa_v2/infrastructure/cubits/attorneys/get_attorneys/attorney_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/presentation/page/contact_us_page/contact_us_page.dart';
import 'package:caspa_v2/presentation/page/etibarname_page/etibarname_page.dart';
import 'package:caspa_v2/presentation/page/gift_balance_page/gift_balance_page.dart';

import 'package:caspa_v2/presentation/page/promo_code_page/promo_code_page.dart';
import 'package:caspa_v2/presentation/page/settings_page/settings_page.dart';

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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/other_shop_widget.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final boxW=(MediaQuery.of(context).size.width/2)-24;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuBox(
                  w: boxW,
                  title: MyText.promoCodeX,
                  content: MyText.forEditAppSettings,
                  color: MyColors.promokodColor,
                  onTap: () => Go.to(context, PromoCodePage()),
                ),
                MenuBox(
                  w: boxW,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuBox(
                  w: boxW,
                  title: MyText.attorneyX,
                  content: MyText.forEditAppSettings,
                  color: MyColors.etibarname,
                  onTap: () {
                    Go.to(context, Pager.attorney);
                  },
                ),
                MenuBox(
                  w: boxW,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuBox(   w: boxW,
                  title: MyText.courierX,
                  content: MyText.forEditAppSettings,
                  color: MyColors.kuryer,
                  onTap: () {
                    ///delete
                    // Go.to(context, BlocProvider(
                    //   create: (context) => OrderHistoryCubit()..fetch(),
                    //   child: OrderHistoryPage(order_history_list: [],),
                    // ));
                  },
                ),
                MenuBox(   w: boxW,
                  title: MyText.settingsX,
                  content: MyText.forEditAppSettings,
                  color: MyColors.settings,
                  onTap: () {
                    Go.to(context, SettingsPage());
                  },
                ),
              ],
            ),
            MySizedBox.h16,
            MenuBox(
              h: 80,
              w: double.maxFinite,
              title: MyText.exit,
              content: MyText.tapForExit,
              color: MyColors.grey245,
              onTap: () {
                // bbbb('ddd');
                // context.read<AuthenticationCubit>()..logOut(context);

                // BlocProvider.of<AuthenticationCubit>(context).logOut(
                //     context);


                context.read<AuthenticationCubit>()
                  ..logOut(context);
              },
            )
          ],
        )
    );
  }
}
