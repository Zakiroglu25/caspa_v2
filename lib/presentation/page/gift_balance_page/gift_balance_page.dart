import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/material.dart';

import 'widgets/gift_code_apply_button.dart';
import 'widgets/gift_code_field.dart';
import 'widgets/gift_codes_list.dart';

class GiftBalancePage extends StatelessWidget {
  GiftBalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: MyText.giftBalanceX,
        notification: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: Paddings.paddingH16,
          children: [
            ColorfullBackImage(
              path: Assets.pngPosTerminal,
              infoTitle: MyText.littleGift,
              infoContent: MyText.InfoGift,
            ),
            MySizedBox.h16,
            GiftCodeField(),
            GiftCodeApplyButton(),
            MySizedBox.h40,
            GiftCodesList(),
            MySizedBox.h16,
          ],
        ),
      ),
    );
  }
}