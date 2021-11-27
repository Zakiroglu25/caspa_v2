import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:flutter/material.dart';

class SectionName extends StatelessWidget {
  String? title;
  double? hP;
  double? vP;
  double? size;

  SectionName({@required this.title,this.vP,this.hP,this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: hP??0,vertical: vP??0),
      child: Text(
        title!,
        style: UITextStyle.tW600Black.copyWith(fontSize: size??16),
      ),
    );
  }
}
