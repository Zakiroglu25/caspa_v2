import 'dart:convert';

import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/gradients.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:math' as math;
import '../../../../infrastructure/models/local/my_user.dart';
import '../../../../locator.dart';
import '../../../../util/constants/preferences_keys.dart';
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
          CaspaButton(
            w: 129,
            h: 44,
            borderRadius: 12,
            textSize: 14,
            text: 'Kuryer sifariş et',
            onTap: () => Go.to(context, Pager.courier()),
          ),
          MySizedBox.h24,
          ValueListenableBuilder(
            valueListenable: Hive.box('main').listenable(),
            builder: (context, Box box, widget) {
              final MyUser user =
                  MyUser.fromJson(json.decode(box.get(SharedKeys.user)));
              final showWheel = user.wheel;
              final bool wheelActive = user.wheel_active;
              if (showWheel) {
                return InkWrapper(
                  onTap:
                      wheelActive ? () => Go.to(context, Pager.wheel()) : null,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F1F9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          MySizedBox.w20,
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(Assets.svgCarx),
                          ),
                          MySizedBox.w12,
                          Text(
                            "Çarx oyna, hədiyyə qazan",
                            style: AppTextStyles.sanF600.copyWith(
                                fontSize: 16.sm, color: MyColors.blue24),
                          ),
                          Spacer(),
                          Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(Assets.winWin)))
                        ],
                      ),
                    ),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
