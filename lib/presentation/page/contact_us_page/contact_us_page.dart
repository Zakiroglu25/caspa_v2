import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        centerTitle: true,
        title: "Əlaqə",
        user: false,
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Müştəri xidmətinə \nmüraciyyət edin",
                style: UITextStyle.tW400BigBlack,
              ),
            ),
            MySizedBox.h32,
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(85, 169, 50, 0.1),
                  child: SvgPicture.asset(Assets.whatsapp),
                ),
                MySizedBox.w12,

                Text("WhatsApp",style: AppTextStyles.sanF600.copyWith(fontSize: 14.sp),)
              ],
            ),
            MySizedBox.h16,
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(230, 250, 249, 1),
                  child: SvgPicture.asset(Assets.telegram),
                ),
                MySizedBox.w12,
                Text("Telegram",style: AppTextStyles.sanF600.copyWith(fontSize: 14.sp),)
              ],
            ),
            MySizedBox.h16,

            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromRGBO(239, 239, 251, 1),
                  child: SvgPicture.asset(Assets.facebook),
                ),
                MySizedBox.w12,
                Text("Facebook Messenger",style: AppTextStyles.sanF600.copyWith(fontSize: 14.sp),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
