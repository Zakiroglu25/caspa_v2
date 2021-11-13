import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VisibleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlipInY(key: Key('a'), child: SvgPicture.asset(Assets.svgEyeOn));
  }
}
