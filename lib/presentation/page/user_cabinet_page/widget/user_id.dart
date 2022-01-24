import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../locator.dart';

class UserID extends StatelessWidget {
  const UserID({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ID:" + " ${_prefs.user.username}",
          style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
        ),
        //Text("C11111"),
        MySizedBox.w16,
        CopyButton(
          '${_prefs.user.username}',
          h: 24.sm,
          w: 24.sm,
        ),
      ],
    );
  }
}
