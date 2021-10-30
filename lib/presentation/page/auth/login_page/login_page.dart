import 'package:caspa_v2/presentation/page/auth/login_page/widgets/login_fields.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/resizable_content.dart';
import 'package:flutter/material.dart';

import 'widgets/log_reg_buttons.dart';
import 'widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ResizableContent(
        child: ListView(
      children: [
        MySizedBox.h60,
        LoginHeaders(),
        MySizedBox.h60,
        LoginFields(),
        MySizedBox.h60,
        LogRegButtons(),
      ],
    ));
  }
}
