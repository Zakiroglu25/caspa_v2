import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_main_text.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_second_text.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

import 'fields/code_field_forgot.dart';

class EnterCodeBody extends StatelessWidget {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySizedBox.h30,
        Flash(child: ForgotMainText(MyText.there_is_code_on_mail)),
        MySizedBox.h16,
        ForgotSecondText(MyText.please_enter_code),
        MySizedBox.h16,
        CodeFieldForgot(),
      ],
    );
  }
}
