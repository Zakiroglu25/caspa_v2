import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.mainColor,
        centerTitle: true,
        title: Text(
          "Tətbiq haqqında",
          style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Caspa Azerbaijan App",
              style: AppTextStyles.sanF600
                  .copyWith(fontSize: 16.sp, color: Colors.white),
            ),
            MySizedBox.h30,
            SvgPicture.asset(Assets.svgCaspaLogoWithName),
            MySizedBox.h30,
            Text(
              "Locale Version: 0.0.1",
              style: AppTextStyles.sanF400
                  .copyWith(color: Colors.white, fontSize: 14.sp),
            ),
            MySizedBox.h20,
            Text(
              "© 2020-2021 Caspa LLC",
              style: AppTextStyles.sanF400
                  .copyWith(color: Colors.white, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
