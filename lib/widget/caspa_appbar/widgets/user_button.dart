import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/widget/general/user_photo.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../presentation/page/landing_page/landing_page.dart';

class UserButton extends StatelessWidget {
  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: IconButton(
            onPressed: () {
              // Go.to(context, Pager.userCabinet());
              globalPageController.animateTo(0,
                  duration: Durations.ms300, curve: Curves.linear);
            },
            icon: UserPhoto(
              editOnTap: false,
            )),
      ),
    );
  }
}
