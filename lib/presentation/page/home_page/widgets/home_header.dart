import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:flutter/material.dart';

import '../../../../locator.dart';
import 'tariffs_courier.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyText.welcome + ", " + _prefs.user.name.toString() + "!",
            style: UITextStyle.tW400BigBlack,
          ),
          MySizedBox.h26,
          SizedBox(
            width: 120,
            height: 120,
            child: Image.asset(Assets.homeMoto),
          ),
          MySizedBox.h16,
          Text("Kuryer xidməti 1₼-dan başlayaraq",
              style: UITextStyle.tW600Black.copyWith(fontSize: 16)),
          MySizedBox.h8,
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: MyText.homePageText,
              children: [
                TextSpan(
                    text: ' *1453',
                    style: AppTextStyles.sanF400
                        .copyWith(color: MyColors.mainColor))
              ],
              style: AppTextStyles.sanF400.copyWith(
                  fontSize: 14.sm, color: MyColors.grey165, height: 20 / 14),
            ),
          ),
          // Text(MyText.homePageText,
          //     style: AppTextStyles.sanF400.copyWith(color: MyColors.grey153)),
          MySizedBox.h18,
          TariffsCourier(),
          MySizedBox.h12,
          AppButton(
            w: 129,
            h: 44,
            borderRadius: 12,
            textSize: 14,
            text: 'Kuryer sifariş et',
            onTap: () => Go.to(context, Pager.courier()),
          ),
        ],
      ),
    );
  }
}
