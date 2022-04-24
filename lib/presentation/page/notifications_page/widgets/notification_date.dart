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
        alignment: Alignment.topLeft,
        child: Text(
            StringOperations.dateConvertFromString(date,
                format: false, smartDay: true),
            style: const TextStyle(
                color: MyColors.grey163, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
