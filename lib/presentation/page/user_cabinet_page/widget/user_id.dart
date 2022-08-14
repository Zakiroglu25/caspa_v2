import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/general/copy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../locator.dart';
import '../../../../util/delegate/string_operations.dart';

class UserID extends StatelessWidget {
  const UserID({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    final userId = _prefs.user.username;
    return InkWrapper(
      onTap: () => StringOperations.copy(userId, context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "ID:" + " ${userId}",
            style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
          ),
          //Text("C11111"),
          MySizedBox.w16,
          CopyButton(
            '$userId',
            h: 24.sm,
            w: 24.sm,
          ),
        ],
      ),
    );
  }
}
