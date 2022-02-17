import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_main_text.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_second_text.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';

import 'fields/number_field.dart';

class EnterMailBody extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySizedBox.h30,
        ForgotMainText(MyText.are_you_forgot_pass),
        MySizedBox.h16,
        ForgotSecondText(MyText.we_will_send_new_pass),
        MySizedBox.h16,
        PhoneFieldForgot(),
      ],
    );
  }
}
