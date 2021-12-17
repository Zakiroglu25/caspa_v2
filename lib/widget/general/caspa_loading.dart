import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class CaspaLoading extends StatelessWidget {
  Color? color;

  CaspaLoading({this.color});

  CaspaLoading.blue({this.color = MyColors.mainColor});

  CaspaLoading.white({this.color = MyColors.white});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FadeIn(
      duration: Duration(milliseconds: 800),
      child: Container(
        height: 20,
        width: 20,
        // color: Colors.green,
        child: CircularProgressIndicator(
          color: color ?? MyColors.mainColor,
        ),
      ),
    ));
  }
}
