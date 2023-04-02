import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoMiniButton extends StatelessWidget {
  const InfoMiniButton({Key? key, required this.onTap, this.svgPath})
      : super(key: key);

  final svgPath;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 44,
      child: AppButton(
        color: MyColors.grey245,
        onTap: () => onTap.call(),
        child: SvgPicture.asset(
          svgPath,
          color: MyColors.black,
        ),
      ),
    );
  }
}
