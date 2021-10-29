import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaspaLogo extends StatelessWidget {
 final Color? color;


  CaspaLogo({this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/svg/logosvg.svg",color: color ,);
  }
}
