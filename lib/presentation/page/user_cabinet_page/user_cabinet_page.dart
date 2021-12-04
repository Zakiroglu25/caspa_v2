import 'package:caspa_v2/presentation/page/landing_page/landing_page.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/balans_box.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/balans_mini_box.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyColors.textBlack),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Şəxsi kabinet",
          style: AppTextStyles.sanF600
              .copyWith(color: MyColors.textBlack, fontSize: 16),
        ),
        actions: [
          InkWell(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/svg/file.svg"),
                              MySizedBox.w20,
                              Text(
                                "Tənzimləmələr",
                                style: AppTextStyles.sanF400.copyWith(
                                    color: Colors.black, fontSize: 17.sp),
                              ),
                            ],
                          ),
                          onPressed: () {
                            ///Settings User Info
                            Navigator.pop(context);
                          },
                        )
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text(
                          'Ləğv et',
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
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(Assets.svgMenuAppbar),
              )),
        ],
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
                btnText: "+ Balansı artır",
                colorbtn: MyColors.btnBlanceCargo,
              ),
              MySizedBox.h16,
              BalanceBox(
                title: "Balans TL",
                price: "120.00₼ ",
                subtitle: "(Sifariş)",
                color: MyColors.balansOrder,
                btnText: "+ Balansı artır",
                colorbtn: MyColors.btnBlanceOrder,
              ),
              MySizedBox.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BalansMiniBox(
                    title: "Son 30 gündə",
                    content: "8.00",
                    color: MyColors.shop,
                    priceColor: MyColors.balanceBoxRed,
                    icon: const Icon(null),
                  ),
                  MySizedBox.w16,
                  BalansMiniBox(
                    title: "Bağalamalar sayı",
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
