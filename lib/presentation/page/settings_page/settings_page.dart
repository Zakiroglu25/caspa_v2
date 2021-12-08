import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/settings_page/app_info_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "Ayarlar ⚙️",
        centerTitle: true,
        user: false,
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,top: 35),
        child: ListView(
          children: [
            SectionName(title: "Tətbiqetmə haqqında"),
            MySizedBox.h45,
            Row(
              children: [
                SvgPicture.asset(Assets.svgFile),
                MySizedBox.w20,
                Text(
                  "Lisenziya sazişi",
                  style: AppTextStyles.sanF400
                      .copyWith(color: Colors.black, fontSize: 17.sp),
                ),
              ],
            ),
            MySizedBox.h45,
            Row(
              children: [
                SvgPicture.asset(Assets.help),
                MySizedBox.w20,
                Text(
                  "Yardım",
                  style: AppTextStyles.sanF400
                      .copyWith(color: Colors.black, fontSize: 17.sp),
                ),
              ],
            ),
            MySizedBox.h45,
            InkWell(
              onTap: (){
                Go.to(context, AppInfoPage());
              },
              child: Row(
                children: [
                  SvgPicture.asset(Assets.infoApp),
                  MySizedBox.w20,
                  Text(
                    "Tətbiq haqqında",
                    style: AppTextStyles.sanF400
                        .copyWith(color: Colors.black, fontSize: 17.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
