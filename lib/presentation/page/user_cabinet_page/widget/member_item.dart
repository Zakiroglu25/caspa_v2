import 'package:caspa_v2/infrastructure/models/local/my_user.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/services/app_members_service.dart';
import '../../../../locator.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/navigate_utils.dart';
import 'member_photo.dart';

class MemberItem extends StatelessWidget {
  const MemberItem({Key? key, required this.user, required this.token})
      : super(key: key);

  static AppMembersService get _memS => locator<AppMembersService>();
  static HiveService get _prefs => locator<HiveService>();

  final MyUser user;
  final String token;

  @override
  Widget build(BuildContext context) {
    final bool isCurrentUser = user.id == _prefs.user.id;
    return CupertinoContextMenuAction(
        //trailingIcon: Icons.add,
        onPressed: () => isCurrentUser
            ? Go.pop(context)
            : Go.andRemove(context, Pager.app(token: token)),
        isDefaultAction: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "${user.fullName}",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.sanF500.copyWith(
                    color: isCurrentUser ? MyColors.mainColor : MyColors.black,
                    fontWeight:
                        isCurrentUser ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 14.sm),
              ),
            ),
            MySizedBox.w2,
            MemberPhoto(
              url: user.avatar,
              h: 25,
              w: 25,
            )
          ],
        ));
  }
}
