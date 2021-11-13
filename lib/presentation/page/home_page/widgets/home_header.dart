import 'package:caspa_v2/presentation/page/kuryer_page/kuryer_page.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.paddingH20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Xoş gəlmisiniz",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: MyColors.textBlack),
          ),
          MySizedBox.h26,
          SizedBox(
            width: 120,
            height: 120,
            child: Image.asset(Assets.homeDino),
          ),
          MySizedBox.h16,
          Text(
            "Çatdırılmanı bizdən edin",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MyColors.textBlack),
          ),
          MySizedBox.h16,
          Text(
            MyText.homePageText,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.grey153),
          ),
          MySizedBox.h14,
          CaspaButton(
            w: 156,
            h: 44,
            textSize: 14,
            text: 'Çatdırılma istəyirəm',
            onTap: (){
              Go.to(context, KuryerPage());
            },
          ),
        ],
      ),
    );
  }
}