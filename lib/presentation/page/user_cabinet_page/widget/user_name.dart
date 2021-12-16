import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../locator.dart';

class UserName extends StatelessWidget {
  PreferencesService get _prefs => locator<PreferencesService>();

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_prefs.user.name} ${_prefs.user.surname}",
      textAlign: TextAlign.center,
      style: AppTextStyles.coHead400.copyWith(
        fontSize: 25.sm,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
