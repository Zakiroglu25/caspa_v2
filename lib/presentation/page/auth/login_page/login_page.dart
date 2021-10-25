import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SvgPicture.asset("assets/svg/logosvg.svg"),
          const Text(
            "Daxil olun",
            style: TextStyle(
              fontFamily: "CoHeadline",
              fontWeight: FontWeight.w400,
              fontSize: 25,
              fontStyle: FontStyle.normal,
              color: MyColors.mainBlue2,
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              MyText.loginText,
              maxLines: 4,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: MyColors.splashLittleText,
                  fontSize: 14,
                  fontFamily: "San Francisco"),
            ),
          ),
        ],
      ),
    );
  }
}
