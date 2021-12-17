import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/user_cabinet_page.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/general/user_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../locator.dart';

class UserButton extends StatelessWidget {


  PreferencesService get _prefs => locator<PreferencesService>();



  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
          onPressed: () => Go.to(context, Pager.userCabinet),
          icon:  UserPhoto()),
    );
  }
}
