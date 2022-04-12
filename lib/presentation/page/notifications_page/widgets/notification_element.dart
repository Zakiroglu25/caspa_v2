// Flutter imports:
// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/models/local/my_user.dart';

class NotificationElement extends StatelessWidget {
  final Function? onXTap;
  final bool? increase;
  final MyNotification notification;
  const NotificationElement({
    Key? key,
    required this.onXTap,
    required this.notification,
    this.increase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: Paddings.paddingA16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title!,
                  style: AppTextStyles.sanF600
                      .copyWith(fontSize: 16, color: MyColors.black34),
                ),
                MySizedBox.h4,
                Text(
                  notification.description!,
                  style: AppTextStyles.sanF600
                      .copyWith(fontSize: 12, color: MyColors.grey153),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: (notification.read == 0)
                    ? MyColors.grey245
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12)),
          ),
        ],
      ),
    );
  }
}