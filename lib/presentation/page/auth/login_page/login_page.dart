import 'package:caspa_v2/presentation/page/auth/forget_password/forget_pass_page.dart';
import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
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
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            MySizedBox.h100,
            SvgPicture.asset("assets/svg/logosvg.svg"),
            MySizedBox.h30,
            buildEnterText(),
            buildLittleText(),
            RowLogin(),
            CaspaField(
              suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: SvgPicture.asset("assets/svg/check.svg")),
              maxLines: 1,
              hint: 'E-mail',
              controller: loginEmailController,
            ),
            MySizedBox.h16,
            RowPassword(),
            MySizedBox.h4,
            CaspaField(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  ForgetPasswordPage()));
              },
              child: const Text(
                "Şifrəni unutmuşam ?",
                style: TextStyle(color: MyColors.mainColor, fontSize: 16),
              ),
            ),
            MySizedBox.h110,
            elevatedButton(),
            MySizedBox.h16,
            registerButton(),
            MySizedBox.h50,

          ],
        ),
      ),
    );
  }

  Padding elevatedButton() {
    return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(343, 52),
                  primary: MyColors.mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint("Valid");
                }
              },
              child: const Text(
                "Daxil Ol",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
  }
  Padding registerButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(343, 52),
            primary: MyColors.mainGrey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: () {
          NavigateUtils.pushNewRoot(context, RegisterPage());
          if (_formKey.currentState!.validate()) {
            debugPrint("Valid");
          }
        },
        child: const Text(
          "Qeydiyyatdan keç",
          style: TextStyle(color: MyColors.textBlack, fontSize: 18),
        ),
      ),
    );
  }

  Padding buildLittleText() {
    return const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: Text(
              MyText.loginText,
              maxLines: 4,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: MyColors.splashLittleText,
                  fontSize: 14,
                  fontFamily: "San Francisco"),
            ),
          );
  }

  Text buildEnterText() {
    return const Text(
            "Daxil olun",
            style: TextStyle(
              fontFamily: "CoHeadline",
              fontWeight: FontWeight.w400,
              fontSize: 25,
              fontStyle: FontStyle.normal,
              color: MyColors.mainBlue2,
            ),
            textAlign: TextAlign.center,
          );
  }
}



