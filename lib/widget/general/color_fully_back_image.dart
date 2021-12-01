import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';

class ColorFullyBackImage extends StatelessWidget {
  const ColorFullyBackImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.pngColorfulBack),
            ),
          ),
        ),
        Positioned(
          top: 65,
          left: 65,
          right: 65,
          child: SizedBox(
            child: Image.asset(
              Assets.pngSebet,
            ),
          ),
        ),
      ],
    );
  }
}
