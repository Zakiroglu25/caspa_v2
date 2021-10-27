import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

class RowLogin extends StatelessWidget {
  const RowLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        MySizedBox.w16,
        Text(
          "Login",
          style: TextStyle(
              fontSize: 14,
              color: MyColors.textFieldLittleText,
              fontFamily: "San Francisco"),
        ),
      ],
    );
  }
}

class RowPassword extends StatelessWidget {
  const RowPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        MySizedBox.w16,
        Text(
          "Password",
          style: TextStyle(
              fontSize: 14,
              color: MyColors.textFieldLittleText,
              fontFamily: "San Francisco"),
        ),
      ],
    );
  }
}