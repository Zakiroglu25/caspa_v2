import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Ellipse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 3,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(1.5),
          child: SvgPicture.asset(
            Assets.svgEllipse,
            //color: MyColors.mainOrange,
          ),
        ),
      ),
    );
  }
}
