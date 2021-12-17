import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/widget/general/errorable_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../locator.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({Key? key}) : super(key: key);

  PreferencesService get _prefs => locator<PreferencesService>();

  @override
  Widget build(BuildContext context) {
    return _prefs.user.avatar==null? SvgPicture.asset(Assets.svgUserCircle) : ErrorableImage(url: _prefs.user.avatar!);
  }
}
