import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(Assets.svgUser)),
    )
;
  }
}
