import 'package:caspa_v2/presentation/page/user_cabinet_page/user_cabinet_page.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
          onPressed: () {
          Go.to(context, const UserCabinetPage());
          },
          icon: SvgPicture.asset(Assets.svgUser)),
    )
;
  }
}
