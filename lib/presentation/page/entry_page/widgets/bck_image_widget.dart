import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      child: Container(
        width: SizeConfig.safeBlockHorizontal! * 200,
        height: SizeConfig.safeBlockVertical! * 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/bck.png"),
          ),
        ),
      ),
    );
  }
}
