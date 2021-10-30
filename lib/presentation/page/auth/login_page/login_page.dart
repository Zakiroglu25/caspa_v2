import 'package:caspa_v2/presentation/page/auth/forget_password/forget_pass_page.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/widgets/email_field.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/widgets/login_fields.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/widgets/pass_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/resizable_content.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_text_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/log_reg_buttons.dart';
import 'widgets/login_header.dart';
import 'widgets/row_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ResizableContent(
        child: ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

/// This is the stateless widget that the main application instantiates.
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RaisedButton(
        onPressed: () {},
        child: const Text('Bottom Button!', style: TextStyle(fontSize: 20)),
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 5,
      ),
    );
  }
}
