import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionsButton extends StatelessWidget {

  final Function? onTap;

  ActionsButton({ this.onTap});

  @override
  Widget build(BuildContext context) {
    if (onTap !=null) {
      return InkWrapper(
        onTap: ()=>onTap?.call(),
        child: Container(
          color: MyColors.transparent,
          child: Row(
            children: [
              SizedBox(
                    width: 20,
                    height: 40,
                    child: SvgPicture.asset(
                      Assets.svgMenuAppbar,
                    ),
                  ),
              MySizedBox.w12,
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
