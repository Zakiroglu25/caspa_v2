import 'dart:convert';

import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/presentation/page/address_page/widget/sliver_info.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/landing_page/landing_page.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/cabinet_menu_item.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/preferences_keys.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../infrastructure/cubits/user/user_cubit.dart';
import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../test/spinner_game.dart';
import 'widget/cabinet_header.dart';
import 'widget/new_balans_box.dart';

class UserCabinetPage extends StatelessWidget {
  UserCabinetPage({Key? key, this.showBack}) : super(key: key);
  bool? showBack;
  static HiveService get _prefs => locator<HiveService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.own_cabinet,
        contextA: context,
        centerTitle: true,
        user: false,
        back: showBack ?? true,
        onBack: () => globalPageController.nextPage(
            duration: Durations.ms300, curve: Curves.linear),
        notification: false,
        onTapActions: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext contextA) => CupertinoActionSheet(
                actions: <Widget>[
                  CabinetMenuItem(
                    title: MyText.settings,
                    icon: SvgPicture.asset(Assets.svgFile),
                    onPressed: () => Go.to(contextA, Pager.userSettingsPage),
                  ),
                  WidgetOrEmpty(
                    value: _prefs.deleteAccount,
                    child: CabinetMenuItem(
                      title: MyText.deleteAccount,
                      icon: Icon(Icons.delete_forever_rounded),
                      onPressed: () => context
                          .read<AuthenticationCubit>()
                          .showLogoutDialog(context, goWithPager: true),
                    ),
                  ),
                  CabinetMenuItem(
                    title: MyText.logout,
                    icon: SvgPicture.asset(Assets.svgLogOut),
                    onPressed: () => context
                        .read<AuthenticationCubit>()
                        .showLogoutDialog(context, goWithPager: true),
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text(
                    MyText.cancel,
                    style: AppTextStyles.sanF500
                        .copyWith(color: Colors.black, fontSize: 16.sp),
                  ),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(contextA, 'Cancel');
                  },
                )),
          );
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('main').listenable(),
        builder: (context, Box box, widget) {
          final MyUser user =
              MyUser.fromJson(json.decode(box.get(SharedKeys.user)));
          return RefreshIndicator(
            color: MyColors.mainColor,
            onRefresh: () async {
              context.read<UserCubit>().getUserData();
            },
            child: SingleChildScrollView(
              padding: Paddings.paddingH16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // MySizedBox.h32,
                  CabinetHeaderWidget(),
                  MySizedBox.h16,
                  SliverInfo(
                    MyText.emergencyCall,
                    align: TextAlign.center,
                  ),
                  MySizedBox.h24,
                  SectionName(title: "Balanslar"),
                  MySizedBox.h16,
                  NewBalanceBox(
                    onTap: () {
                      Go.to(
                          context,
                          Pager.paymentPage(
                              paymentBalanceType: PaymentBalanceType.cargo));
                    },
                    icon: Assets.pngAirplane,
                    boxTitle: MyText.cargoBalance,
                    title: "Balans: ${user.cargoBalance} \$ ",
                    subtitle: MyText.cargoBalance,
                    subtitleColor: MyColors.mainColor,
                    desc: "",
                    color: MyColors.balansCargo,
                  ),
                  MySizedBox.h16,
                  NewBalanceBox(
                    onTap: () {
                      Go.to(
                          context,
                          Pager.paymentPage(
                              paymentBalanceType: PaymentBalanceType.order));
                    },
                    icon: Assets.pngDollar,
                    boxTitle: MyText.orderBalance,
                    title: "${MyText.balance}: ${user.balance} TL ",
                    subtitle: MyText.orderBalance,
                    subtitleColor: MyColors.greenOrderBalance,
                    desc: "",
                    color: MyColors.balansOrder,
                  ),
                  MySizedBox.h16,

                  NewBalanceBox(
                    onTap: () => Go.to(context, Pager.bonus),
                    icon: Assets.pngGift,
                    boxTitle: MyText.bonus,
                    title: "${MyText.balance}: " + "${user.bonus}" + " \$",
                    subtitle: MyText.giftBalance,
                    subtitleColor: MyColors.balanceBoxRedAlternativ,
                    desc: "",
                    color: MyColors.shop,
                  ),
                  MySizedBox.h16,

                  ///carx
                  NewBalanceBox(
                    onTap: () {
                      Go.to(context, MyHomePage());
                    },
                    icon: Assets.pngNote,
                    boxTitle: "Carx",
                    title: "${MyText.balance}: ${user.balance} TL ",
                    subtitle: MyText.giftBalance,
                    subtitleColor: MyColors.balanceBoxRedAlternativ,
                    desc: MyText.desc,
                    color: MyColors.shop,
                  ),
                  // MySizedBox.h16,
                  // BalanceBox(
                  //     title: "Balans TL",
                  //     price: "${user.balance ?? 0} TL",
                  //     subtitle: "(Sifariş)",
                  //     color: MyColors.balansOrder,
                  //     btnText: MyText.increaseBalance,
                  //     colorbtn: MyColors.btnBlanceOrder,
                  //     onTap: () => Go.to(
                  //         context,
                  //         Pager.paymentPage(
                  //           paymentBalanceType: PaymentBalanceType.order,
                  //         ))),
                  //
                  // ///bu hediyye balansi novbeti update de olacaq
                  // // MySizedBox.h16,
                  // // BalansMiniBox(
                  // //   title: "Caspa-dan hədiyyə",
                  // //   w: MediaQuery.of(context).size.width,
                  // //   content: "\$ ${_prefs.user.monthly}",
                  // //   color: MyColors.balanceCountPackage,
                  // //   priceColor: MyColors.balanceBoxOrange,
                  // //   icon: Text("Bitmə vaxtı"),
                  // //   finishTime: "14 gün",
                  // // ),
                  // MySizedBox.h16,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     BalansMiniBox(
                  //       title: MyText.durtingCurrentMonth,
                  //       content: "\$ ${_prefs.user.monthly}",
                  //       color: MyColors.shop,
                  //       priceColor: MyColors.balanceBoxRed,
                  //       icon: const Icon(null),
                  //       finishTime: "",
                  //     ),
                  //     MySizedBox.w16,
                  //     BalansMiniBox(
                  //       title: MyText.countOfOrders,
                  //       content: "${_prefs.user.active_package_count}",
                  //       color: MyColors.balanceCountPackage,
                  //       onTap: () => Go.to(
                  //         context,
                  //         Pager.package(back: true),
                  //       ),
                  //       priceColor: MyColors.balanceBoxOrange,
                  //       icon: SvgPicture.asset(Assets.svgBalanceUp),
                  //       finishTime: "",
                  //     ),
                  //   ],
                  // ),
                  // // MySizedBox.h16,
                  // //
                  // // Row(
                  // //   children: [
                  // //     BalansMiniBox(
                  // //       title: MyText.cashbackProfile,
                  // //       content: "${_prefs.user.cashback_balance}\$ ",
                  // //       color: MyColors.balansCargo,
                  // //       priceColor: MyColors.mainColor,
                  // //       icon: const Icon(null),
                  // //       finishTime: "",
                  // //     ),
                  // //   ],
                  // // ),
                  // MySizedBox.h50,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
