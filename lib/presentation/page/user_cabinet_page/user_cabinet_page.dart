import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/balans_box.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/balans_mini_box.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../locator.dart';
import 'widget/cabinet_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCabinetPage extends StatelessWidget {
  const UserCabinetPage({Key? key}) : super(key: key);
  HiveService get _prefs => locator<HiveService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.own_cabinet,
        contextA: context,
        centerTitle: true,
        user: false,
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
                          style: AppTextStyles.sanF400
                              .copyWith(color: Colors.black, fontSize: 17.sp),
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
                          style: AppTextStyles.sanF400
                              .copyWith(color: Colors.black, fontSize: 17.sp),
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
                    style: AppTextStyles.sanF400
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MySizedBox.h32,
              CabinetHeaderWidget(),
              BalanceBox(
                title: "Balans USD",
                price: "\$ ${_prefs.user.cargoBalance}",
                subtitle: "(Daşınma)",
                color: MyColors.balansCargo,
                btnText: MyText.increaseBalance,
                colorbtn: MyColors.btnBlanceCargo,
              ),
              MySizedBox.h16,
              BalanceBox(
                title: "Balans TL",
                price: "${_prefs.user.balance ?? 0} TL",
                subtitle: "(Sifariş)",
                color: MyColors.balansOrder,
                btnText: MyText.increaseBalance,
                colorbtn: MyColors.btnBlanceOrder,
              ),
              MySizedBox.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BalansMiniBox(
                    title: MyText.durtingCurrentMonth,
                    content: "\$ ${_prefs.user.monthly}",
                    color: MyColors.shop,
                    priceColor: MyColors.balanceBoxRed,
                    icon: const Icon(null),
                  ),
                  MySizedBox.w16,
                  BalansMiniBox(
                    title: MyText.countOfOrders,
                    content: "${_prefs.user.packages_count}",
                    color: MyColors.balanceCountPackage,
                    priceColor: MyColors.balanceBoxOrange,
                    icon: SvgPicture.asset(Assets.svgBalanceUp),
                  ),
                ],
              ),
              MySizedBox.h50,
            ],
          ),
        ),
      ),
    );
  }
}
