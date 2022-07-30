import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/widgets/login_fields.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/resizable_content.dart';
import 'package:flutter/material.dart';

import 'widgets/log_reg_buttons.dart';
import 'widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return ResizableContent(
        footer: Padding(
          padding: Paddings.paddingH16,
          child: LogRegButtons(),
        ),
        child: FadeInUp(
          duration: Duration(milliseconds: 400),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //   Spacer(),
              MySizedBox.h50,
              LoginHeaders(),
              MySizedBox.h20,
              LoginFields(),
              //MySizedBox.h20,
              //Spacer(),
              // LogRegButtons(),
            ],
          ),
        ));
  }
}
