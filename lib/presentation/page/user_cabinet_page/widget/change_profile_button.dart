import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../infrastructure/services/app_members_service.dart';
import '../../../../locator.dart';
import 'member_add_button.dart';
import 'member_change_button.dart';
import 'member_item.dart';

class ChangeProfileButton extends StatelessWidget {
  const ChangeProfileButton({Key? key}) : super(key: key);

  static AppMembersService get _memS => locator<AppMembersService>();

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      actions: [
        ..._memS.appMembers.map((e) {
          final user = e.user;
          final token = e.token;
          return MemberItem(
            user: user!,
            token: token!,
          );
        }).toList(),
        const MemberAddButton()
      ],
      child: MemberChangeButton(),
    );
  }
}
