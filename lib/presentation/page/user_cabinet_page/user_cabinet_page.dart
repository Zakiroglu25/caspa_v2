import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/balans_box.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/balans_mini_box.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widget/cabinet_header.dart';

class UserCabinetPage extends StatelessWidget {
  const UserCabinetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "Şəxsi kabinet",
        contextA: context,
        centerTitle: true,
        user: false,
        notification: false,
        onTapActions: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
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
                    onPressed: () => Go.to(context, Pager.userSettingsPage),
                  ),
                  CupertinoActionSheetAction(
                    child: Row(
                      children: [
                        SvgPicture.asset(Assets.logOut),
                        MySizedBox.w20,
                        Text(
                          MyText.logout,
                          style: AppTextStyles.sanF400
                              .copyWith(color: Colors.black, fontSize: 17.sp),
                        ),
                      ],
                    ),
                    onPressed: () {
                     // context.read<AuthenticationCubit>()..logOut(context);
                    },
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
                    Navigator.pop(context, 'Cancel');
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
                title: "Balans TL",
                price: "120.00₼ ",
                subtitle: "(Daşınma)",
                color: MyColors.balansCargo,
                btnText: MyText.increaseBalance,
                colorbtn: MyColors.btnBlanceCargo,
              ),
              MySizedBox.h16,
              BalanceBox(
                title: "Balans TL",
                price: "120.00₼ ",
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
                    title: MyText.last30days,
                    content: "8.00",
                    color: MyColors.shop,
                    priceColor: MyColors.balanceBoxRed,
                    icon: const Icon(null),
                  ),
                  MySizedBox.w16,
                  BalansMiniBox(
                    title: MyText.countOfOrders,
                    content: "4",
                    color: MyColors.balanceCountPackage,
                    priceColor: MyColors.balanceBoxOrange,
                    icon: SvgPicture.asset(Assets.balanceUp),
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
