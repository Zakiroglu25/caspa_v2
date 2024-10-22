import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductPhoto extends StatelessWidget {
  const ProductPhoto({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.sm,
      height: 72.sm,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Center(child: SvgPicture.asset(Assets.svgShop)),
    );
  }
}
