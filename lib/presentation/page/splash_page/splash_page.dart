import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/widget/general/caspa_logo_with_name.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widgets/caspa_az_text.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Lottie.asset(Assets.oneYear, repeat: true),
            CaspaLogoWithName(),
            CaspaAzText()
          ],
        ),
      ),
    );
  }
}
