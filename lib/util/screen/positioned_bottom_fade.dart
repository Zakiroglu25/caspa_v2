import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class PositionedBottomFade extends StatelessWidget {
  const PositionedBottomFade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 115,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                //MyColors.white,
                //  MyColors.white,
                MyColors.white,
                MyColors.white,
                MyColors.white,
                MyColors.white,
                MyColors.white,
                MyColors.white.withOpacity(0.9),
                MyColors.white.withOpacity(0.8),
           //     MyColors.white.withOpacity(0.7),
                MyColors.white.withOpacity(0.6),
             //   MyColors.white.withOpacity(0.5),
              //  MyColors.white.withOpacity(0.4),
                MyColors.white.withOpacity(0.3),
               // MyColors.white.withOpacity(0.2),
               // MyColors.white.withOpacity(0.1),
                MyColors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ));
  }
}
