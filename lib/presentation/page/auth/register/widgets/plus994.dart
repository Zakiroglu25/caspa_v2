import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class Plus994 extends StatelessWidget {
  const Plus994({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        width: 55,
        height: 10,
        padding: EdgeInsets.only(left: 10),
        child: Center(
            child: Text(
              "+994",
              style: AppTextStyles.coHead400.copyWith(color: MyColors.black,fontSize: 16),
            )));
  }
}