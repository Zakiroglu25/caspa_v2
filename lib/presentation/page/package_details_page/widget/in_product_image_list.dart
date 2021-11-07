import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InProductImageList extends StatelessWidget {
  const InProductImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing: 8,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: MyColors.mainGrey,
            ),
            child: Center(child: SvgPicture.asset(Assets.svgShop)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: MyColors.mainGrey,
            ),
            child: Center(child: SvgPicture.asset(Assets.svgShop)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: MyColors.mainGrey,
            ),
            child: Center(child: SvgPicture.asset(Assets.svgShop)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: MyColors.mainGrey,
            ),
            child: Center(child: SvgPicture.asset(Assets.svgShop)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Container(
            width: 108,
            height: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: MyColors.mainGrey,
            ),
            child: Center(child: SvgPicture.asset(Assets.svgShop)),
          ),
        ),
      ],
    );
  }
}
