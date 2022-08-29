import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../infrastructure/services/app_members_service.dart';
import '../../../../locator.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';

class MemberChangeButton extends StatelessWidget {
  const MemberChangeButton({Key? key}) : super(key: key);

  static AppMembersService get _memS => locator<AppMembersService>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.transparent,
      child: Container(
        width: 160,
        height: 44,
        decoration: BoxDecoration(
          color: MyColors.black34,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.svgUser,
              color: MyColors.white,
            ),
            MySizedBox.w12,
            Text(
              MyText.changeUser + " (${_memS.appMembers.length})",
              style: AppTextStyles.sanF500
                  .copyWith(color: MyColors.white, fontSize: 14.sm),
            ),
          ],
        ),
      ),
    );
  }
}
