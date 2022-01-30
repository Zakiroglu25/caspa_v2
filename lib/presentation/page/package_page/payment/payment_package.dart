import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PackagePayment extends StatelessWidget {
  const PackagePayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        user: false,
        notification: false,
      ),
      body: Padding(
        padding: Paddings.paddingA16,
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: SvgPicture.asset(Assets.pngPosTerminal),
            ),
            SectionName(
              title: 'Ödəniş edin',
            ),
            MySizedBox.h16,
            Text(
              MyText.weAdviceSaveMoneyOnBalance,
              style: AppTextStyles.sanF400Grey,
            ),
          ],
        ),
      ),
    );
  }
}
