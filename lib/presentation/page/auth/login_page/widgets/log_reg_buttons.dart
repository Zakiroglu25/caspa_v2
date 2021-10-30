import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

class LogRegButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loginButton(),
        MySizedBox.h16,
        registerButton(),
        MySizedBox.h50,
      ],
    );
  }

  CaspaButton loginButton() {
    return CaspaButton(
      onTap: () {},
      text: "login",
    );
  }

  CaspaButton registerButton() {
    return CaspaButton(
      color: MyColors.greyWhite,
      textColor: MyColors.black,
      // borderColor: MyColors.mainColor,
      onTap: () {},
      text: "registration",
    );
  }
}
