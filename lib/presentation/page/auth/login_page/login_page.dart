import 'package:caspa_v2/presentation/page/auth/forget_password/forget_pass_page.dart';
import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/row_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            MySizedBox.h100,
            CaspaLogo(),
            MySizedBox.h30,
            buildEnterText(),
            MySizedBox.h20,
            buildLittleText(),
            CaspaField(
              title: "email",
              maxLines: 1,
              hint: 'E-mail',
              controller: loginEmailController,
            ),
            MySizedBox.h16,
            CaspaField(
              title: "password",
              suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: SvgPicture.asset("assets/svg/check.svg")),
              hint: 'Password',
              maxLines: 1,
              textInputType: TextInputType.visiblePassword,
              controller: loginPasswordController,
              obscure: true,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgetPasswordPage()));
              },
              child: const Text(
                "Şifrəni unutmuşam ?",
                style: TextStyle(color: MyColors.mainColor, fontSize: 16),
              ),
            ),
            MySizedBox.h110,
            loginButton(),
            MySizedBox.h16,
            registerButton(),
            MySizedBox.h50,
          ],
        ),
      ),
    );
  }

  CaspaButton loginButton() {
    return CaspaButton(
      onTap: () {},
      text: "login",
    );
  }

  CaspaButton registerButton() {
    return CaspaButton(
      color: MyColors.greyWhite,
      textColor: MyColors.black,
     // borderColor: MyColors.mainColor,
      onTap: () {
        NavigateUtils.pushNewRoot(context, RegisterPage());
      },
      text: "registration",
    );
  }

  Center buildLittleText() {
    return Center(
      child: Text(
        MyText.loginText,
        style: AppTextStyles.coHead400.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }

  Center buildEnterText() {
    return Center(
      child: Text(
        "Daxil olun",
        style: AppTextStyles.coHead400.copyWith(fontSize: 25),
      ),
    );
  }
}
