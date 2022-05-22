import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/delegate/string_operations.dart';

class NotificationDate extends StatelessWidget {
  const NotificationDate({Key? key, required this.date}) : super(key: key);
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingV8 + Paddings.paddingT8,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.fromLTRB(16,10,16,10),
          decoration: BoxDecoration(
            color: MyColors.grey245,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
              StringOperations.dateConvertFromString(date,
                  format: false, smartDay: true),
              style: AppTextStyles.sanF400),
        ),
      ),
    );
  }
}
