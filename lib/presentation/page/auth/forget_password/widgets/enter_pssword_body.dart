import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/fields/main_pass_field_forgot.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/fields/second_pass_field_forgot.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_main_text.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_second_text.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/paddings.dart';


class EnterPasswordBody extends StatelessWidget {
  TextEditingController mainPassController = TextEditingController();
  TextEditingController secondPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.paddingH20,
      child: Column(
        children: [
          MySizedBox.h30,
          ForgotMainText(MyText.set_new_pass),
          MySizedBox.h16,
          ForgotSecondText(MyText.your_pass_reseted),
          MySizedBox.h16,
          MainPassFieldForgot(controller:mainPassController),
          MySizedBox.h8,
          SecondPassFieldForgot(controller:secondPassController),
        ],
      ),
    );
  }
}
