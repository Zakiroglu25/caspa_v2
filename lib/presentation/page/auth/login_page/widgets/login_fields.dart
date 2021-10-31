import 'package:caspa_v2/presentation/page/auth/forget_password/forget_pass_page.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/widgets/pass_field.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_text_button.dart';
import 'package:flutter/material.dart';

import 'email_field.dart';

class LoginFields extends StatelessWidget {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailField(_emailController),
        MySizedBox.h16,
        PassField(_passController),
        MySizedBox.h16,
        CaspaTextButton(
          text: "forgot_pass",
          onTap: () => NavigateUtils.pushNewRoot(context, ForgetPasswordPage()),
        ),
      ],
    );
  }
}
