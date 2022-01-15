import 'package:caspa_v2/presentation/page/auth/login_page/widgets/pass_field.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
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
        EmailFieldLogin(
            StringOperations.stringToController('esev.sv@gmail.com')),
        //MySizedBox.h16,

        PassField(StringOperations.stringToController('b45631a2c')),
        MySizedBox.h16,
        CaspaTextButton(
          text: MyText.forgot_pass,
          onTap: () => Go.to(context, Pager.forgotPass),
        ),
      ],
    );
  }
}
