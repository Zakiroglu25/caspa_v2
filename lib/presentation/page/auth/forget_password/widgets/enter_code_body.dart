import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'fields/code_field_forgot.dart';

class EnterCodeBody extends StatelessWidget {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.paddingH20,
      child: Column(
        children: [
          MySizedBox.h30,
          Text(
            MyText.there_is_code_on_mail,
            style: AppTextStyles.coHead400.copyWith(fontSize: 25),
          ),
          MySizedBox.h16,
          Text(
            MyText.please_enter_code,
            textAlign: TextAlign.center,
            style: AppTextStyles.sanF400
                .copyWith(fontSize: 14, color: MyColors.grey165),
          ),
          MySizedBox.h16,
          CodeFieldForgot(codeController),
        ],
      ),
    );
  }
}
