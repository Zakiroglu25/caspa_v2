import 'dart:convert';

import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/presentation/page/address_page/widget/sliver_info.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/landing_page/landing_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/preferences_keys.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../infrastructure/cubits/user/user_cubit.dart';
import 'widget/cabinet_header.dart';
import 'widget/new_balans_box.dart';

class UserCabinetPage extends StatelessWidget {
  UserCabinetPage({Key? key, this.showBack}) : super(key: key);
  bool? showBack;

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
                  CupertinoActionSheetAction(
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.svgFile),
                        MySizedBox.w20,
                        Text(
                          MyText.settings,
                          style: AppTextStyles.sanF500
                              .copyWith(color: Colors.black, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    onPressed: () => Go.to(contextA, Pager.userSettingsPage),
                  ),
                  CupertinoActionSheetAction(
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.svgLogOut),
                        MySizedBox.w20,
                        Text(
                          MyText.logout,
                          style: AppTextStyles.sanF500
                              .copyWith(color: Colors.black, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    onPressed: () => context
                        .read<AuthenticationCubit>()
                        .showLogoutDialog(context, goWithPager: true),
                  )
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
                    title: "${MyText.balance}: " +
                        "${user.bonus!.toStringAsFixed(2)}" +
                        " \$",
                    subtitle: MyText.giftBalance,
                    subtitleColor: MyColors.balanceBoxRedAlternativ,
                    desc: "",
                    color: MyColors.shop,
                  ),
                  Image.network(
                      "https://static.remove.bg/remove-bg-web/c4b29bf4b97131238fda6316e24c9b3606c18000/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg"),
                  MySizedBox.h16,

                  if (user.wheel == true)
                    NewBalanceBox(
                      onTap: () {
                        if (user.wheel_active == true)
                          Go.to(context, Pager.wheel);
                      },
                      icon: Assets.svgCarx,
                      boxTitle: "Çarx",
                      title: user.wheel_active == false
                          ? "Yeni həftədə çarx aktiv olacaq"
                          : "",
                      subtitle: user.wheel_active == false
                          ? "Çarx aktiv deyil"
                          : "Çarx aktivdir",
                      subtitleColor: MyColors.balanceBoxRedAlternativ,
                      desc:
                          "Çarx həftə ərzinde 1 dəfə oyananılır.1 həftə tamam olduqda,çarxa klik edə bilərsiniz. ",
                      color: MyColors.mainBlue127,
                    ),
                  MySizedBox.h32,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
