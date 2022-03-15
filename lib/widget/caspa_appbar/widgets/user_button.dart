import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/general/user_photo.dart';
import 'package:flutter/material.dart';
import '../../../locator.dart';

class UserButton extends StatelessWidget {
  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
            onPressed: () => Go.to(context, Pager.userCabinet),
            icon: UserPhoto()),
      ),
    );
  }
}
