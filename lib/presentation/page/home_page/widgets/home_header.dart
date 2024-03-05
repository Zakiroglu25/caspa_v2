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
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;
import '../../../../infrastructure/models/local/my_user.dart';
import '../../../../locator.dart';
import '../../../../util/constants/preferences_keys.dart';
import '../../../../util/screen/snack.dart';
import '../../../../widget/custom/buttons/app_button.dart';
import '../../../../widget/general/more_button.dart';
import 'section_name.dart';
import 'tariffs_courier.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
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
            // height: 120,
            child: Image.asset(Assets.homeMoto),
          ),
          MySizedBox.h16,
          Text("Kuryer xidməti 2₼-dan başlayaraq",
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
          MySizedBox.h18,
          SectionName(
            title: MyText.courierTarriffs,
            hP: 0,
            tile: MoreButton(
              onTap: () => Go.to(context, Pager.courierTarifDetails),
            ),
          ),
          MySizedBox.h4,
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
          MySizedBox.h24,
          // ValueListenableBuilder(
          //   valueListenable: Hive.box('main').listenable(),
          //   builder: (context, Box box, widget) {
          //     final MyUser user =
          //         MyUser.fromJson(json.decode(box.get(SharedKeys.user)));
          //     final showWheel = user.wheel;
          //     final bool wheelActive = user.wheel_active;
          //     if (showWheel) {
          //       return InkWrapper(
          //         onTap: () {
          //           if (wheelActive) {
          //             Go.to(context, Pager.wheel());
          //           } else {
          //             Snack.positive(
          //                 message:
          //                     "Həftədə bir dəfə qazana bilərsiniz. Növbəti həftə sizi bir daha gözləyirik");
          //           }
          //         },
          //         // wheelActive ? () => Go.to(context, Pager.wheel()) : null,
          //         child: Padding(
          //           padding: const EdgeInsets.only(right: 16),
          //           child: Container(
          //             height: 64,
          //             decoration: BoxDecoration(
          //               color: wheelActive
          //                   ? const Color(0xFFF1F1F9)
          //                   : const Color(0xFFF5F5F5),
          //               borderRadius: BorderRadius.circular(12),
          //             ),
          //             child: Row(
          //               children: [
          //                 MySizedBox.w24,
          //                 Text(
          //                   "Çarx oyna, hədiyyə qazan",
          //                   style: AppTextStyles.sanF600.copyWith(
          //                       fontSize: 16.sm,
          //                       color: wheelActive
          //                           ? MyColors.blue24
          //                           : MyColors.black),
          //                 ),
          //                 const Spacer(),
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.circular(8.0),
          //                   child: Image.asset(Assets.pngHalfWhell),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     }
          //     return const SizedBox.shrink();
          //   },
          // )
        ],
      ),
    );
  }
}
