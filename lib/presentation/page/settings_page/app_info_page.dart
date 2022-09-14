import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../infrastructure/configs/base.dart';
import '../../../locator.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({Key? key}) : super(key: key);
  static PackageInfo get info => locator<PackageInfo>();
  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.mainColor,
        centerTitle: true,
        title: Text(
          MyText.about_app,
          style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${Configs.appName} App",
              style: AppTextStyles.sanF600
                  .copyWith(fontSize: 16.sp, color: Colors.white),
            ),
            MySizedBox.h30,
            SvgPicture.asset(Assets.svgCaspaLogoWithName),
            MySizedBox.h30,
            Text(
              "${MyText.version}: ${info.version} (${info.buildNumber})",
              style: AppTextStyles.sanF400
                  .copyWith(color: Colors.white, fontSize: 14.sp),
            ),
            MySizedBox.h20,
            Text(
              "© 2020-$year Caspa LLC",
              style: AppTextStyles.sanF400
                  .copyWith(color: Colors.white, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
