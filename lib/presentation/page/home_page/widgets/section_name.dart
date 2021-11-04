import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionName extends StatelessWidget {
  String? title;
  double? hP;
  double? vP;

  SectionName({@required this.title,this.vP,this.hP});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hP??0,vertical: vP??0),
      child: Text(
        title!,
        style: TextStyle(
            color: MyColors.textBlack, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
