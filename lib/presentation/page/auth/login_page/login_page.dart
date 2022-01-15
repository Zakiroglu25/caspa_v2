import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/widgets/login_fields.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/resizable_content.dart';
import 'package:caspa_v2/widget/general/single_child_bounce.dart';
import 'package:flutter/material.dart';
import 'widgets/log_reg_buttons.dart';
import 'widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ResizableContent(
        child: FadeInUp(
      duration: Duration(milliseconds: 400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          MySizedBox.h20,
          LoginHeaders(),
          MySizedBox.h20,
          LoginFields(),
          //MySizedBox.h20,
          Spacer(),
          LogRegButtons(),
        ],
      ),
    ));
  }
}
