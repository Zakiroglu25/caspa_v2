import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/balans_box.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserCabinetPage extends StatelessWidget {
  const UserCabinetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyColors.textBlack),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Şəxsi kabinet",
          style: AppTextStyles.sanF600
              .copyWith(color: MyColors.textBlack, fontSize: 16),
        ),
        actions: [
          SvgPicture.asset(Assets.svgMenuAppbar),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ListView(
          children: [
            MySizedBox.h32,
            CircleAvatar(
              radius: 64,
              child: Image.asset(Assets.pngMoto),
              backgroundColor: MyColors.grey153,
            ),
            MySizedBox.h16,
            Align(
              alignment: Alignment.center,
              child: Text(
                "Baxtiyar Zakiroglu",
                style: AppTextStyles.coHead400.copyWith(
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            MySizedBox.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ID:" + "C11111",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16),
                ),
                //Text("C11111"),
                MySizedBox.w16,
                SvgPicture.asset(
                  Assets.svgCopy,
                  color: MyColors.grey153,
                ),
              ],
            ),
            MySizedBox.h16,
            Text(
              MyText.userCabinet,
              textAlign: TextAlign.center,
              style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
            ),
            BalanceBox(
              title: "Dasinma",
              price: "120",
              subtitle: "Daşınma",
              color: MyColors.balans
            )
          ],
        ),
      ),
    );
  }
}
