import 'package:caspa_v2/presentation/page/auth/login_page/login_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonSkip extends StatelessWidget {
  const ButtonSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: const Text(
          "Keç",
          style: TextStyle(color: MyColors.mainColor, fontSize: 16),
        ),
      ),
    );
  }
}
