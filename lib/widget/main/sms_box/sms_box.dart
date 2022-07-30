import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../widget/general/copy_button.dart';
import '../../../util/delegate/string_operations.dart';
import 'widgets/sms_code.dart';
import 'widgets/sms_time.dart';

class SmsBox extends StatelessWidget {
  const SmsBox({Key? key, required this.code, required this.time})
      : super(key: key);
  final String code;
  final String time;

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => StringOperations.copy(code, context),
      child: Container(
        margin: Paddings.paddingV4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmsTime(
                  time: time,
                ),
                MySizedBox.h2,
                SmsCode(
                  code: code,
                )
              ],
            ),
            CopyButton(
              code,
              color: MyColors.mainColor,
            )
          ],
        ),
        padding: Paddings.paddingA16 + Paddings.paddingH4,
        decoration: BoxDecoration(
            color: MyColors.grey245, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
