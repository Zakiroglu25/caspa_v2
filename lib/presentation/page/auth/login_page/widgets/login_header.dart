import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_logo.dart';
import 'package:flutter/material.dart';

class LoginHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CaspaLogo(),
        MySizedBox.h30,
        buildEnterText(),
        MySizedBox.h20,
        buildLittleText(),
      ],
    );
  }

  Center buildEnterText() {
    return Center(
      child: Text(
        MyText.login,
        style: AppTextStyles.coHead400.copyWith(fontSize: 25),
      ),
    );
  }

  Center buildLittleText() {
    return Center(
      child: Text(
        MyText.loginText,
        style: AppTextStyles.sanF400
            .copyWith(fontSize: 14, color: MyColors.grey165),
        textAlign: TextAlign.center,
      ),
    );
  }
}
