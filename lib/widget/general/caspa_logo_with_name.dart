import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaspaLogoWithName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeIn(child: SvgPicture.asset(Assets.svgCaspaLogoWithName));
  }
}