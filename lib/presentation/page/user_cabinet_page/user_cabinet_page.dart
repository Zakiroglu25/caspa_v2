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
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../infrastructure/cubits/user/user_cubit.dart';
import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../util/screen/widget_or_empty.dart';
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
            duration: AppDurations.ms300, curve: Curves.linear),
        notification: false,
        onTapActions: () => buildShowCupertinoModalPopup(context),
      ),
      body: FocusDetector(
        onFocusGained: () => context.read<UserCubit>().getUserData(),
        child: RefreshIndicator(
          color: MyColors.mainColor,
          onRefresh: () async {
            context.read<UserCubit>().getUserData(isLoading: true);
          },
          child: ValueListenableBuilder(
            valueListenable: Hive.box('main').listenable(),
            builder: (context, Box box, widget) {
              final MyUser user =
                  MyUser.fromJson(json.decode(box.get(SharedKeys.user)));
              final showWheel = user.wheel;
              final bool wheelActive = user.wheel_active;
              // wheelActive = Random().nextBool();
              return SingleChildScrollView(
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
                    SectionName(title: MyText.balances),
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
                      title: "${MyText.balance}: ${user.cargoBalance} \$ ",
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
                      onTap: () {
                        Go.to(
                            context,
                            Pager.paymentPage(
                                paymentBalanceType: PaymentBalanceType.order));
                      },
                      icon: Assets.bank,
                      boxTitle: MyText.last30days,
                      title: "${MyText.priceBalance}: ${user.monthly} \$ ",
                      subtitle: MyText.last30days,
                      subtitleColor: MyColors.greenOrderBalance,
                      desc: "",
                      color: MyColors.balanceCountPackage,
                    ),
                    MySizedBox.h16,

                    NewBalanceBox(
                      onTap: () => Go.to(context, Pager.bonus),
                      icon: Assets.pngGift,
                      boxTitle: MyText.bonus,
                      title:
                          "${MyText.balance}: ${user.bonus?.toStringAsFixed(2)} \$",
                      subtitle: MyText.giftBalance,
                      subtitleColor: MyColors.balanceBoxRedAlternativ,
                      desc: "",
                      color: MyColors.shop,
                    ),
                    // MySizedBox.h16,

                    // if (showWheel)
                    //   NewBalanceBox(
                    //     onTap: wheelActive
                    //         ? () => Go.to(context, Pager.wheel())
                    //         : null,
                    //     icon: Assets.svgCarx,
                    //     boxTitle: "Çarx",
                    //     title: !wheelActive
                    //         ? "Yeni həftədə çarx aktiv olacaq"
                    //         : "",
                    //     subtitle:
                    //         !wheelActive ? "Çarx aktiv deyil" : "Çarx aktivdir",
                    //     subtitleColor: MyColors.black,
                    //     desc: MyText.whellDetails,
                    //     color: MyColors.mainBlue127,
                    //   ),
                    MySizedBox.h32,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowCupertinoModalPopup(BuildContext context) {
    return showCupertinoModalPopup(
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
  }
}
